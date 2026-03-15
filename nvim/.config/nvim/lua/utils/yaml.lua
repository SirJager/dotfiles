local M = {}
local yaml = require 'lyaml'

local ORDER = {
  first = { 'type', 'title' },
  last = { 'date', 'created', 'updated', 'authors', 'author', 'option' },
}

local function find_frontmatter(lines)
  if lines[1] ~= '---' then
    return nil, nil
  end

  for i = 2, #lines do
    if lines[i] == '---' then
      return 1, i
    end
  end
end

function M.reorder(tbl)
  local out = {}
  local used = {}

  for _, k in ipairs(ORDER.first) do
    if tbl[k] ~= nil then
      out[k] = tbl[k]
      used[k] = true
    end
  end

  local middle = {}
  for k in pairs(tbl) do
    if not used[k] and not vim.tbl_contains(ORDER.last, k) then
      table.insert(middle, k)
    end
  end

  table.sort(middle)

  for _, k in ipairs(middle) do
    out[k] = tbl[k]
  end

  for _, k in ipairs(ORDER.last) do
    if tbl[k] ~= nil then
      out[k] = tbl[k]
    end
  end

  return out
end

function M.parse(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local s, e = find_frontmatter(lines)

  if not s then
    return {}, 0
  end

  local yaml_text = table.concat(vim.list_slice(lines, s + 1, e - 1), '\n')
  local data = yaml.load(yaml_text) or {}

  return data, e
end

function M.update(bufnr, key, value)
  local fm, end_line = M.parse(bufnr)
  fm[key] = value
  M.write(bufnr, fm, end_line)
end

function M.write(bufnr, data, end_line)
  data = M.reorder(data)
  local dumped = yaml.dump { data }
  local out = {}
  for line in dumped:gmatch '[^\n]+' do
    if line ~= '...' then
      table.insert(out, line)
    end
  end
  table.insert(out, '---')
  if end_line == 0 then
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, out)
  else
    vim.api.nvim_buf_set_lines(bufnr, 0, end_line, false, out)
  end
end

return M
