local M = {
  'echasnovski/mini.files',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    'echasnovski/mini.icons',
    'nvim-tree/nvim-web-devicons',
  },
}

local MiniFiles = {
  show_all = false,
  -- patterns to hide (lua patterns)
  hide_patterns = {
    '^%..*', -- dotfiles
    '^node_modules$',
    '^%.cache$',
    '^%.settings$',
    '^%.git$',
    '^%.gitignore$',
    '^pnpm-lock.yaml$',
    '^bun.lock$',
  },
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

  -- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-files.md#default-config
  options = {
    -- - Delete file or directory by deleting **whole line** describing it.
    -- - If `options.permanent_delete` is `true`, delete is permanent. Otherwise
    -- file system entry is moved to a module-specific trash directory
    -- (see |MiniFiles.config| for more details).
    -- ~/.local/share/nvim/mini.files/trash
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
  for _, pattern in ipairs(MiniFiles.hide_patterns) do
    if name:match(pattern) then
      return true
    end
  end
  return false
end

MiniFiles.filter_hide = function(fs_entry)
  return not MiniFiles.should_hide(fs_entry.name)
end

MiniFiles.filter_show = function()
  return true
end

MiniFiles.toggle_hidden = function()
  MiniFiles.show_all = not MiniFiles.show_all
  local minifiles = require 'mini.files'
  minifiles.refresh {
    content = {
      filter = MiniFiles.show_all and MiniFiles.filter_show or MiniFiles.filter_hide,
    },
  }
end

M.config = function(_, _opts)
  require('mini.icons').setup {}
  local minifiles = require 'mini.files'
  local opts = vim.tbl_deep_extend('force', _opts or {}, {
    content = {
      filter = MiniFiles.filter_hide,
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
