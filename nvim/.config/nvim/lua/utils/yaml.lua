local M = {}
local yaml = require 'lyaml'

local ORDER = {
  sequence = {},
}

local frontmatter = {
  order = { 'type', 'id', 'title', '<middle>', 'updated', 'date' },
  keys = {
    id = true,
    type = true,
    title = true,
    updated = true,
    date = true,
  },
}

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
  local s, e = M._helper_fm_find(lines)

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

function M.write(bufnr, fm, end_line)
  local new = { '---' }
  local fm_keys = frontmatter.keys
  local keys_order = frontmatter.order

  local function format(k, v)
    if v == nil then
      return k .. ': ~'
    end

    if v == '' then
      return k .. ': ""'
    end

    if type(v) == 'table' then
      return k .. ': ' .. vim.fn.json_encode(v)
    end

    return k .. ': ' .. tostring(v)
  end

  -- collect middle keys
  local middle = {}
  for k in pairs(fm) do
    if not fm_keys[k] then
      table.insert(middle, k)
    end
  end
  table.sort(middle)

  for _, key in ipairs(keys_order) do
    if key == '<middle>' then
      for _, k in ipairs(middle) do
        table.insert(new, format(k, fm[k]))
      end
    else
      if fm[key] ~= nil then
        table.insert(new, format(key, fm[key]))
      end
    end
  end

  table.insert(new, '---')

  -- IMPORTANT: ensure raw write (no re-encoding)
  vim.api.nvim_buf_set_lines(bufnr, 0, end_line, false, new)
end

function M._helper_fm_find(lines)
  if lines[1] ~= '---' then
    return nil, nil
  end
  for i = 2, #lines do
    if lines[i] == '---' then
      return 1, i
    end
  end
end

function M._helper_is_field_empty(fm, key)
  if not key then
    return true
  end
  local k = string.lower(key)
  local v = fm[k]
  if v == nil then
    return true
  end
  if type(v) == 'string' then
    return v == '' or v == '~'
  end
  if type(v) == 'table' then
    return vim.tbl_isempty(v)
  end
  return false
end

function M.schema_presentation(fm)
  if not fm.title or fm.title == '' then
    fm.title = 'Write a short title'
  end
  if not fm.authors then
    fm.authors = {}
  end
  return fm
end

function M.schema_project(fm)
  fm = fm or {}

  local function is_empty(v)
    return v == nil or v == ''
  end

  if is_empty(fm.id) then
    fm.id = 'project-id'
  end

  if is_empty(fm.title) then
    fm.title = 'Write a short title'
  end

  if is_empty(fm.github) then
    fm.github = 'https://github.com/sirjager/<repository>'
  end

  if is_empty(fm.status) then
    fm.status = 'Planning'
  end

  if is_empty(fm.name) then
    fm.name = 'Project-Name'
  end

  if is_empty(fm['due date']) then
    fm['due date'] = ''
  end

  if is_empty(fm.priority) then
    fm.priority = 'Medium'
  end

  if is_empty(fm.tags) then
    fm.tags = {}
  end

  if is_empty(fm.collaborators) then
    fm.collaborators = {}
  end

  if is_empty(fm.updated) then
    fm.updated = os.date '!%Y-%m-%dT%H:%M:%SZ'
  end

  return fm
end

return M
