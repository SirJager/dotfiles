local M = {
  'stevearc/conform.nvim',
  lazy = false,
}

M.opts = {
  notify_no_formatters = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'eslint_d', lsp_format = 'fallback', stop_after_first = true, timeout_ms = 5000 },
    typescript = { 'prettierd', 'eslint_d', lsp_format = 'fallback', stop_after_first = true, timeout_ms = 5000 },
    javascriptreact = { 'prettierd', 'eslint_d', lsp_format = 'fallback', stop_after_first = true, timeout_ms = 5000 },
    typescriptreact = { 'prettierd', 'eslint_d', lsp_format = 'fallback', stop_after_first = true, timeout_ms = 5000 },
    go = { 'goimports', 'gofmt' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    mark = { 'rustfmt', lsp_format = 'fallback' },
    svelte = { 'prettierd' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    json = { 'prettierd' },
    golang = { 'golines' },
    -- yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    graphql = { 'prettierd' },
    toml = { 'taplo' },
    sh = { 'beautysh' },
    bash = { 'beautyshc' },
    python = { 'isort', 'black' },
    kdl = { 'kdlfmt' },
    ['*'] = { 'codespell' },
    ['_'] = { 'trim_whitespace' },
  },
}

M.config = function(_, opts)
  require('conform').setup(opts)
end

return M
