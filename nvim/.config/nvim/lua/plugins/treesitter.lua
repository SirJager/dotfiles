local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-context"
  },
}

M.opts = {
  sync_install = false,
  auto_install = true,
  markid = { enable = true },
  playground = { enable = false },
  matchup = { enable = true, disable = { 'c', 'ruby', 'rust' } },
  indent = { enable = true, disable = { 'yaml', 'python', 'yml' } },
  incremental_selection = { enable = true },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = function(lang, buf)
      if vim.tbl_contains({ 'latex', 'tex' }, lang) then
        return true
      end
      local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile_disable_treesitter')
      return status_ok and big_file_detected
    end,
  },

  refactor = {
    highlight_current_scope = {
      enable = true,
    },
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~101.
    },
    smart_rename = { enable = true },
    navigation = { enable = true },
    indent = { enable = true, disable = { 'yaml', 'yml', 'python' } },
  },

  textobjects = {
    select = { enable = true, lookahead = true },
  },
}

function M.config(_, opts)
  vim.filetype.add { extension = { rasi = 'rasi' } }
  -- for astro framework
  vim.filetype.add { extension = { astro = 'astro' } }
  vim.filetype.add { extension = { mdx = 'mdx' } }
  vim.filetype.add { extension = { mdoc = 'mdoc' } }

  vim.treesitter.language.register('markdown', 'mdx')
  vim.treesitter.language.register('markdown', 'mdoc')
  vim.treesitter.language.register('css', 'rasi')

  require('nvim-treesitter').setup(opts)
  -- require'treesitter-context'.setup{}
end

M.init = function()

-- stylua: ignore start
  local ensureInstalled = { 'diff', 'bash', 'jq', 'lua', 'html', "latex", 
  'typst', 'yaml', 'markdown', 'markdown_inline', 'typescript', 'tsx', 
  'javascript', 'json', 'css', 'scss', 'astro', 'rasi', 'vim', 'vimdoc', 
  'regex', 'go', 'python', 'beancount' }
  -- stylua: ignore end
  local alreadyInstalled = require('nvim-treesitter.config').get_installed()
  local parsersToInstall = vim
    .iter(ensureInstalled)
    :filter(function(parser)
      return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()

  require('nvim-treesitter').install(parsersToInstall)

  vim.api.nvim_create_autocmd('FileType', {
    callback = function()
      -- Enable treesitter highlighting and disable regex syntax
      pcall(vim.treesitter.start)
      -- Enable treesitter-based indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
