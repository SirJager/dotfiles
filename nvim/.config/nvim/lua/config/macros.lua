local macro = vim.fn.setreg
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local esc = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)

augroup('macros:webdev', { clear = true })
autocmd('FileType', {
  group = 'macros:webdev',
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'astro' },
  callback = function()
    macro('l', "yoconsole.log('" .. esc .. 'pa:' .. esc .. 'la, ' .. esc .. 'pl')
  end,
})
