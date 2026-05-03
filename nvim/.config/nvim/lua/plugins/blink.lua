local M = {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = 'v1.10.1',
  dependencies = {
    { 'saghen/blink.compat', event = 'InsertEnter' },
    { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp', event = 'InsertEnter' },
    { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
    { 'roobert/tailwindcss-colorizer-cmp.nvim', event = 'InsertEnter' },
    { 'becknik/blink-cmp-luasnip-choice', event = 'InsertEnter' },
    { 'kirasok/cmp-hledger', ft = { 'ledger', 'hledger', 'journal', 'beancount' }, event = 'InsertEnter' }, -- yay -S hledger
    { 'phenax/cmp-graphql', event = 'InsertEnter' },
    { 'mgalliou/blink-cmp-tmux', event = 'InsertEnter' },
    -- { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, event = 'InsertEnter' },
    { 'Kaiser-Yang/blink-cmp-dictionary', event = 'InsertEnter' },
  },
  opts_extend = { 'sources.default' },
}

M.opts = {
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  snippets = {
    preset = 'luasnip',
  },

  appearance = { nerd_font_variant = 'mono' },
  signature = { window = { border = 'rounded' } },
  cmdline = {
    enabled = true,
    completion = { ghost_text = { enabled = false }, menu = { auto_show = true } },
  },
  completion = {
    ghost_text = { enabled = true },
    trigger = {
      prefetch_on_insert = true,
      show_in_snippet = true,
      show_on_backspace = false,
      show_on_insert = false,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      treesitter_highlighting = true,
      window = {
        border = 'rounded',
        min_width = 10,
        max_width = 80,
        max_height = 20,
      },
    },
    menu = {
      border = 'rounded',
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },
}

M.opts.sources = {
  default = {
    'lsp',
    'snippets',
    'path',
    'hledger',
    'buffer',
    'tailwindcss',
    'tmux',
    -- 'dadbod',
    'dictionary',
  },
  providers = {
    lsp = {
      name = 'LSP',
      enabled = true,
      score_offset = 100,
      module = 'blink.cmp.sources.lsp',
      async = true,
    },

    snippets = {
      name = 'snippets',
      enabled = true,
      max_items = 70,
      score_offset = 85,
      min_keyword_length = 0,
      module = 'blink.cmp.sources.snippets',
      override = {
        get_trigger_characters = function(_)
          return { ';', '#' }
        end,
      },
    },
    path = {
      name = 'Path',
      module = 'blink.cmp.sources.path',
      score_offset = 80,
      enabled = true,
      fallbacks = { 'snippets', 'buffer' },
      opts = {
        trailing_slash = false,
        label_trailing_slash = true,
        show_hidden_files_by_default = true,
        get_cwd = function(context)
          return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
        end,
      },
    },
    buffer = {
      name = 'Buffer',
      enabled = true,
      max_items = 3,
      score_offset = 60,
      module = 'blink.cmp.sources.buffer',
      min_keyword_length = 2,
    },
    tailwindcss = {
      -- tailwindcss-colorizer-cmp
      enabled = true,
      name = 'tailwindcss-colorizer-cmp',
      module = 'blink.compat.source',
    },
    tmux = {
      enabled = true,
      name = 'tmux',
      module = 'blink-cmp-tmux',
      opts = { panes = 'all', capture_history = false, triggered_only = false, trigger_chars = { '.' } },
    },
    dadbod = {
      enabled = false,
      name = 'Dadbod',
      module = 'vim_dadbod_completion.blink',
      score_offset = 85, -- the higher the number, the higher the priority
    },
    hledger = {
      enabled = true,
      name = 'hledger',
      module = 'blink.compat.source',
      score_offset = 90, -- the higher the number, the higher the priority
    },
    dictionary = {
      enabled = true,
      name = 'Dict',
      module = 'blink-cmp-dictionary',
      score_offset = 10,
      max_items = 8,
      min_keyword_length = 3,
      opts = {
        dictionary_directories = { vim.fn.expand '~/dotfiles/assets/dictionaries' },
        dictionary_files = {
          vim.fn.expand '~/.config/nvim/spell/en.utf-8.add',
        },
      },
    },
  },
}

M.opts.keymap = {
  preset = 'none', -- set to 'none' to disable the 'default' preset
  --
  ['<C-y>'] = { 'select_and_accept' },
  ['<C-f>'] = { 'select_and_accept' },
  -- ['<C-i>'] = { 'snippet_forward' },
  -- ['<C-u>'] = { 'snippet_backward' },
  --
  ['<C-b>'] = { 'select_prev' },
  ['<C-n>'] = { 'select_next' },
  -- ['<C-k>'] = { 'select_prev' },
  -- ['<C-j>'] = { 'select_next' },
  --
  ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
  ['<C-o>'] = { 'scroll_documentation_up' },
  ['<C-p>'] = { 'scroll_documentation_down' },
  -- ['<C-h>'] = { 'scroll_documentation_up' },
  -- ['<C-l>'] = { 'scroll_documentation_down' },
  --
  ['<C-e>'] = { 'hide', 'fallback' },
}

M.config = function(_, opts)
  require('tailwindcss-colorizer-cmp').setup { color_square_width = 2 }
  require('cmp-graphql').setup { schema_path = 'graphql.schema.json' }
  require('blink.cmp').setup(opts)
  require('luasnip').setup()
  require('luasnip.loaders.from_vscode').lazy_load {
    paths = { vim.fn.stdpath 'config' .. '/snippets' },
  }

  -- require('null-ls').register(require 'null-ls-bean-check')
end

return M
