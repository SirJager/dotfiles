local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 10000,
  lazy = false,
}

M.opts = {
  flavour = 'auto', -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = 'latte',
    dark = 'mocha',
  },
  transparent_background = true, -- disables setting the background color.
  float = {
    transparent = false, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = 'dark',
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { 'italic' }, -- Change the style of comments
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
    virtual_text = {
      errors = { 'italic' },
      hints = { 'italic' },
      warnings = { 'italic' },
      information = { 'italic' },
      ok = { 'italic' },
    },
    underlines = {
      errors = { 'underline' },
      hints = { 'underline' },
      warnings = { 'underline' },
      information = { 'underline' },
      ok = { 'underline' },
    },
    inlay_hints = {
      background = true,
    },
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = true,
  auto_integrations = false,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = '',
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
}

M.opts.custom_highlights = function(c)
  local primary = '#f5a97f'
  -- primary = require('globals.utils').getLine('/home/jager/.cache/wal/colors', 3)

  local none = 'None' -- to nil / transparent
  local text = '#B4BEFE' -- for text
  local lineNr = '#525280'
  local dimtext = '#9AA7FE'

  local black = '#000000'
  local dark = '#242438'

  local secondary = '#4635B1'
  -- secondary = require('globals.utils').getLine('/home/jager/.cache/wal/colors', 2)

  local border = { fg = primary, bg = none }
  local cursorline = { fg = primary, bg = '#292c3c' }

  return {
    Visual = { bg = dark }, -- visual text selection
    LineNr = { fg = lineNr, bg = none, ctermbg = none }, -- line numbers

    HoverNormal = { fg = primary, bg = none, ctermbg = none },
    HoverBorder = border,

    NormalFloat = { bg = none },
    FloatBorder = border,
    FloatTitle = { fg = text, bg = none },
    FloatFooter = { fg = text, bg = none },
    FloatShadow = { bg = none },

    BlinkCmpMenu = { bg = none, fg = text },
    BlinkCmpMenuBorder = border,
    BlinkCmpDocBorder = border,
    BlinkCmpSignatureHelpBorder = { fg = secondary, bg = none },

    NoiceCmdlinePopupBorder = border,
    NoiceCmdlinePopupBorderHelp = border,
    NoiceCmdlinePopupBorderSearch = border,
    NoiceCmdlinePopupBorderInput = border,
    NoiceCmdlinePopupBorderLua = border,

    MiniFilesBorder = { fg = primary, bg = none },
    MiniFilesDirectory = { fg = dimtext },
    MiniFilesCursorLine = cursorline,
  }
end

return M
