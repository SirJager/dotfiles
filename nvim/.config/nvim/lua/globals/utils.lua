local M = {}

-- Utility: flatten multiple tables into one flat list
M.flattable = function(...)
  local result = {}
  local function flatten(tbl)
    for _, v in ipairs(tbl) do
      if type(v) == 'table' then
        flatten(v)
      else
        table.insert(result, v)
      end
    end
  end
  for i = 1, select('#', ...) do
    local tbl = select(i, ...)
    if type(tbl) == 'table' then
      flatten(tbl)
    end
  end
  return result
end

M.mark_cmd = function(cmd)
  -- delete ALL marks (no input needed)
  if cmd == 'delmarks!' then
    vim.cmd 'delmarks A-Z0-9'
    vim.notify 'Deleted all marks'
    return
  end

  -- read one character (silent, no dialog)
  local char = vim.fn.getcharstr()

  -- validate input
  if not char or #char ~= 1 then
    vim.notify('Invalid mark key', vim.log.levels.WARN)
    return
  end

  -- delmarks <char> (delete single mark)
  if cmd == 'delmarks' then
    vim.cmd('delmarks ' .. char)
    vim.notify('Deleted mark: ' .. char)
    return
  end

  -- normal mark operations: set mark or jump to mark
  vim.cmd('normal! ' .. cmd .. char)
end

function M.parse_frontmatter(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  if lines[1] ~= '---' then
    return {}, 0
  end

  local fm = {}
  local end_line = 0

  for i = 2, #lines do
    if lines[i] == '---' then
      end_line = i
      break
    end

    local k, v = lines[i]:match '^([%w_-]+):%s*(.*)'
    if k then
      fm[k] = v
    end
  end

  return fm, end_line
end

function M.write_yaml(key, value, indent, out)
  indent = indent or ''
  out = out or {}
  if type(value) ~= 'table' then
    table.insert(out, indent .. key .. ': ' .. tostring(value))
    return out
  end
  table.insert(out, indent .. key .. ':')
  for k, v in pairs(value) do
    M.write_yaml(k, v, indent .. '  ', out)
  end
  return out
end

function M.contains(list, key)
  for _, v in ipairs(list) do
    if v == key then
      return true
    end
  end
  return false
end

function M.write_frontmatter(bufnr, fm, end_line)
  local new = { '---' }
  local used = {}

  local order = {
    first = { 'type', 'title' },
    middle = {},
    last = { 'updated', 'date' },
  }

  -- first
  for _, k in ipairs(order.first or {}) do
    if fm[k] ~= nil then
      table.insert(new, k .. ': ' .. fm[k])
      used[k] = true
    end
  end

  -- collect middle
  local middle = {}
  for k in pairs(fm) do
    if not used[k] and not M.contains(order.first, k) and not M.contains(order.last, k) then
      table.insert(middle, k)
    end
  end

  table.sort(middle)

  -- explicit middle
  for _, k in ipairs(order.middle or {}) do
    if fm[k] ~= nil and not used[k] then
      table.insert(new, k .. ': ' .. fm[k])
      used[k] = true
    end
  end

  -- remaining middle alphabetical
  for _, k in ipairs(middle) do
    if not used[k] then
      table.insert(new, k .. ': ' .. fm[k])
      used[k] = true
    end
  end

  -- last
  for _, k in ipairs(order.last or {}) do
    if fm[k] ~= nil then
      table.insert(new, k .. ': ' .. fm[k])
    end
  end

  table.insert(new, '---')

  vim.api.nvim_buf_set_lines(bufnr, 0, end_line, false, new)
end

M.getLine = function(path, target)
  if target < 1 then
    return nil
  end

  local i = 0
  for line in io.lines(path) do
    i = i + 1
    if i == target then
      return line
    end
  end

  return nil
end

return M
