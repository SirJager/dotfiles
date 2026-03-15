local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

autocmd({ 'BufEnter', 'BufWritePost' }, {
  callback = function()
    local file = vim.fn.expand '%:p'
    if file ~= '' then
      vim.fn.system { 'tmux', 'set', '-g', '@current_file', file }
    end
  end,
})

autocmd({ 'BufEnter' }, {
  callback = function()
    vim.cmd 'set formatoptions-=cro'
  end,
})

-- text highlight when yanking
autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 120 }
  end,
})

autocmd({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown', 'NeogitCommitMessage', 'ledger' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == 'lazy' then
  vim.cmd.close()
  autocmd('User', {
    pattern = 'DashboardLoaded',
    callback = function()
      require('lazy').show()
      vim.opt.showtabline = 2
    end,
  })
end

usercmd('ToggleSpellChecker', function()
  vim.opt.spell = not vim.opt.spell:get()
  local status = vim.opt.spell:get() and 'enabled' or 'disabled'
  vim.notify('Spell Checker ' .. status, vim.log.levels.INFO)
end, {})

autocmd('InsertEnter', {
  callback = function()
    vim.g.snacks_scroll = false
  end,
})

autocmd('InsertLeave', {
  callback = function()
    vim.g.snacks_scroll = true
  end,
})

autocmd({ 'BufEnter', 'BufWinEnter', 'FileType' }, {
  callback = function(args)
    local ft_disabled = { 'mdx', 'lua', 'typescript', 'javascript' }
    local ft_enabled = {}

    local ft = vim.bo[args.buf].filetype

    if vim.tbl_contains(ft_disabled, ft) then
      vim.wo.spell = false
      return
    end

    if #ft_enabled > 0 then
      vim.wo.spell = vim.tbl_contains(ft_enabled, ft)
    end
  end,
})

autocmd('BufWritePre', {
  pattern = { '*.md', '*.mdx', '*.mdoc' },
  callback = function(args)
    local bufnr = args.buf
    local yaml = require 'utils.yaml'
    local fm, end_line = yaml.parse(bufnr)
    local now = os.date '%Y-%m-%dT%H:%M:%S.00Z'

    --- updated
    if fm.updated then
      fm.updated = now
    end

    if fm.date then
      fm.date = now
    end

    -- type: presentation
    if vim.tbl_contains({ 'presentation', 'slides', 'slide', 'ppt' }, fm.type) then
      if not fm.title or fm.title == '' then
        fm.title = 'Write a short title'
      end

      if not fm.authors then
        fm.authors = {}
      end
    end

    yaml.write(bufnr, fm, end_line)
    vim.notify('Frontmatter updated', vim.log.levels.INFO, { title = 'AutoCMD: Markdown' })
  end,
})
