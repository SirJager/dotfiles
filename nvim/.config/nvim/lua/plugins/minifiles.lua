local M = {
  'echasnovski/mini.files',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'echasnovski/mini.icons',
    'nvim-tree/nvim-web-devicons',
  },
}

-- escape lua patterns
local to_lua_pattern = function(str)
  local escaped = str:gsub('([%^%$%(%)%%%.%[%]%*%+%-%?])', '%%%1')
  return '^' .. escaped .. '$'
end

local always_show_patterns = {
  '^%.local$',
  '^%.config$',
}

local hide_patterns = {
  '^%..*',
  '^node_modules$',
  '^%.cache$',
  '^%.settings$',
  '^%.git$',
  '^%.gitignore$',
  '^bun.lock$',
  '^%.fuse_hidden*',
  '%.tsbuildinfo$',
  to_lua_pattern '.fuse_hidden*',
  to_lua_pattern 'pnpm-lock.yaml',
}

-- global state file (per-cwd states)
local state_file = vim.fn.stdpath 'data' .. '/mini-files-state'

local function get_cwd()
  return vim.uv.cwd()
end

-- read all states
local function read_all()
  local map = {}
  local f = io.open(state_file, 'r')
  if not f then
    return map
  end

  for line in f:lines() do
    local path, val = line:match '^(.-)|(%d)$'
    if path then
      map[path] = val == '1'
    end
  end

  f:close()
  return map
end

-- write all states
local function write_all(map)
  local lines = {}
  for path, val in pairs(map) do
    table.insert(lines, path .. '|' .. (val and '1' or '0'))
  end
  vim.fn.writefile(lines, state_file)
end

-- read current cwd state
local function read_state()
  local map = read_all()
  return map[get_cwd()] or false
end

-- write current cwd state
local function write_state(enabled)
  local map = read_all()
  map[get_cwd()] = enabled
  write_all(map)
end

local MiniFiles = {
  show_all = read_state(),
}

M.opts = {
  content = {
    filter = nil,
    prefix = nil,
    sort = nil,
  },

  mappings = {
    close = 'q',
    go_in = 'l',
    go_in_plus = 'L',
    go_out = 'h',
    go_out_plus = 'H',
    mark_goto = 'M',
    mark_set = 'm',
    reset = 'R',
    reveal_cwd = '.',
    show_help = 'g?',
    synchronize = 's',
    trim_left = '<',
    trim_right = '>',
  },

  options = {
    permanent_delete = false,
    use_as_default_explorer = true,
  },

  windows = {
    max_number = math.huge,
    preview = false,
    width_focus = 50,
    width_nofocus = 15,
    width_preview = 25,
  },
}

MiniFiles.should_hide = function(name)
  -- always show takes absolute priority
  for _, pattern in ipairs(always_show_patterns) do
    if name:match(pattern) then
      return false
    end
  end

  -- normal hide rules
  for _, pattern in ipairs(hide_patterns) do
    if name:match(pattern) then
      return true
    end
  end
  return false
end

MiniFiles.filter_hide = function(fs_entry)
  return not MiniFiles.should_hide(fs_entry.name)
end

MiniFiles.toggle_hidden = function()
  MiniFiles.show_all = not MiniFiles.show_all
  write_state(MiniFiles.show_all)
  require('mini.files').refresh {
    content = {
      filter = function(fs_entry)
        if MiniFiles.show_all then
          return true
        end
        return MiniFiles.filter_hide(fs_entry)
      end,
    },
  }
end

M.config = function(_, _opts)
  require('mini.icons').setup {}
  local minifiles = require 'mini.files'

  local opts = vim.tbl_deep_extend('force', _opts or {}, {
    content = {
      filter = function(fs_entry)
        if MiniFiles.show_all then
          return true
        end
        return MiniFiles.filter_hide(fs_entry)
      end,
    },
  })

  minifiles.setup(opts)

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      vim.keymap.set('n', 'g.', MiniFiles.toggle_hidden, { buffer = args.data.buf_id })
    end,
  })
end

return M
