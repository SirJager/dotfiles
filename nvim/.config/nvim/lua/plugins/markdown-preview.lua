local M = {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown', 'mdx', 'mdoc', 'org', 'vimwiki' },
  build = 'cd app && bun install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown', 'mdx', 'mdoc', 'org', 'vimwiki' }
  end,
}

return M
