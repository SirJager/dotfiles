return {
  root_dir = function(...)
    return require('lspconfig/util').root_pattern('package.json', 'tsconfig.json')(...)
  end,
  init_options = {
    preferences = {
      -- https://github.com/microsoft/TypeScript/blob/3b45f4db12bbae97d10f62ec0e2d94858252c5ab/src/server/protocol.ts#L3439
      disableSuggestions = false, -- false
      quotePreference = 'single',
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'literal',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        -- includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = false,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}
