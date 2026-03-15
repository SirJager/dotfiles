local M = {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'b0o/SchemaStore.nvim',
    'onsails/lspkind-nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'jay-babu/mason-null-ls.nvim',
    'nvimtools/none-ls.nvim',
  },
  cmd = {
    'Mason',
    'MasonLog',
    'MasonUpdate',
    'MasonInstall',
    'MasonUninstall',
    'MasonUninstallAll',
  },
}

M.servers = {
  lsp = {
    'astro',
    'lua_ls',
    'stylua',
    -- 'biome',
    'bashls',
    'buf_ls',
    'clangd',
    'taplo',
    'pyright',
    'sqls',
    'yamlls',
    'jsonls',
    'dockerls',
    'docker_compose_language_service',
    -- 'marksman', --
    'markdown_oxide',
    'emmet_ls',
    'html',
    'cssls',
    'cssmodules_ls',
    'ts_ls',
    'tailwindcss',
    'gopls',
    'golangci_lint_ls',
    'vimls',
  },
  linters = {
    'shellcheck',
    'mypy',
    'hadolint',
    'markdownlint',
    'eslint_d',
    'protolint',
    'gospel',
    'golangci-lint',
  },
  formatters = {
    'black',
    'beautysh',
    'prettierd',
    'shfmt',
    'kdlfmt',
    'sqlfmt',
    'jq',
    'prettierd',
    'codespell',
    'fixjson',
    'goimports_reviser',
    'gofumpt',
    'golines',
    'yamlfix',
  },
  compiler = {
    'eslint-lsp',
    'tree-sitter-cli',
  },
}

function M.config()
  require('lspkind').setup()
  local flat = require('globals.utils').flattable
  local servers = flat(M.servers.formatters, M.servers.lsp, M.servers.linters, M.servers.compiler)

  require('mason').setup {
    ui = {
      border = 'rounded',
      icons = {
        package_pending = ' ',
        package_installed = '󰄳 ',
        package_uninstalled = ' 󰚌 ',
      },
    },
  }

  require('mason-lspconfig').setup {
    automatic_enable = true,
    automatic_installation = true,
    ensure_installed = M.servers.lsp,
  }

  require('mason-null-ls').setup {
    automatic_installation = true,
    ensure_installed = flat(M.servers.formatters, M.servers.linters, M.servers.compiler),
  }

  vim.api.nvim_create_user_command('MasonInstallAll', function()
    local servers_str = table.concat(servers, ' ')
    vim.cmd('MasonInstall ' .. servers_str)
  end, {})

  -----------------------------------------------------------------------------
  --- Markdown Oxide
  -----------------------------------------------------------------------------
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Use the function call form to MERGE (not replace) the config
  vim.lsp.config('markdown_oxide', {
    -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
    -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
    capabilities = vim.tbl_deep_extend('force', capabilities, {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }),
  })
  -----------------------------------------------------------------------------

  vim.lsp.enable(M.servers.lsp)
end

return M
