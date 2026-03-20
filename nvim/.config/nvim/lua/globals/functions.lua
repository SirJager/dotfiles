local M = {}

function M.markdown_frontmatter()
  local ok, err = pcall(function()
    local bufnr = vim.api.nvim_get_current_buf()
    local yaml = require 'utils.yaml'

    local fm, end_line = yaml.parse(bufnr)
    if not fm then
      error 'No frontmatter found'
    end

    local fm_type = fm.type and string.lower(fm.type) or nil

    -- updated
    if fm.updated then
      fm.updated = os.date '%Y-%m-%dT%H:%M:%S.00Z'
    end

    -- presentation
    if vim.tbl_contains({ 'presentation', 'slides', 'slide', 'ppt' }, fm_type) then
      fm = yaml.schema_presentation(fm)
    end

    -- project
    if vim.tbl_contains({ 'project' }, fm_type) then
      fm = yaml.schema_project(fm)
    end

    yaml.write(bufnr, fm, end_line)
  end)

  if not ok then
    vim.notify(err, vim.log.levels.ERROR, {
      title = 'Frontmatter Error',
    })
  end
end

return M
