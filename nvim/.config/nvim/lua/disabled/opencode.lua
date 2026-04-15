local M = {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require('opencode').snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
    },
  },
}

M.config = function(_, _opts)
  vim.o.autoread = true -- Required for `opts.events.reload`
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type opencode.Opts
  vim.g.opencode_opts = {
    -- Your configuration, if any; goto definition on the type or field for details
  }
end

return M
