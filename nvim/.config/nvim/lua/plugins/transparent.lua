local M = {
  'xiyaowong/transparent.nvim',
  lazy = false,
}

M.opts = {
  transparent = vim.g.transparent_enabled,
  -- table: default groups
  groups = {
    'Normal',
    'NormalFloat',
    'NormalNC',

    'FloatTitle',
    'FloatFooter',
    'FloatBorder',
    'FloatShadow',

    'HoverNormal',
    'HoverBorder',

    'PmenuSel',
    'PmenuSbar',
    'PmenuThumb',

    'MiniFilesBorder',

    -- 'BlinkCmpMenu',
    -- 'BlinkCmpItemIdx',
    -- 'BlinkCmpMenuBorder',
    -- 'BlinkCmpDocBorder',
    -- 'BlinkCmpSignatureHelpBorder',
  },
  extra_groups = {},
}

local disabled = {

  'LineNr',
  'Visual',

  'MiniFilesNormal',
  'MiniFilesFile',
  'MiniFilesDirectory',
  -- 'MiniFilesCursorLine',

  'WhichKeyBorder',
  'WhichKeyTitle ',

  'NoiceCmdlinePopupBorder',
  'NoiceCmdlinePopupBorderHelp',
  'NoiceCmdlinePopupBorderSearch',
  'NoiceCmdlinePopupBorderInput',
  'NoiceCmdlinePopupBorderLua',
}

M.config = function(_, opts)
  require('transparent').setup(opts)
end

return M
