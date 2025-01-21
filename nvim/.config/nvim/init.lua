-------
-------
-------

require "ankur.spec"
require "ankur.options"
require "ankur.autocmds"
require("ankur.keymaps").setup()

spec "ankur.core.notify"
spec "ankur.theme.onedark"
-- spec "ankur.theme.catppuccin"

-- spec "ankur.core.snacks"
spec "ankur.core.dashboard" 

spec "ankur.core.whichkey"
spec "ankur.core.windline"
spec "ankur.core.noice"
spec "ankur.core.devicons"
spec "ankur.core.neotree"
spec "ankur.core.telescope"
spec "ankur.core.tmuxnavigator"

spec "ankur.lsps.mason"
spec "ankur.lsps.mason_null_ls"
spec "ankur.lsps.mason_lspconfig"
spec "ankur.lsps.none-ls"

spec "ankur.lsps.treesitter"
spec "ankur.lsps.schemastore"
spec "ankur.lsps.lspconfig"
spec "ankur.lsps.lspsaga"
spec "ankur.lsps.comments"
spec "ankur.lsps.cmp"

-- spec "ankur.lsps.tests"
-- spec "ankur.lsps.dap"
spec "ankur.lsps.go"

-- spec "ankur.lsps.flutter"

spec "ankur.lsps.surround"
spec "ankur.lsps.autopairs"
spec "ankur.lsps.autotags"

-- spec "ankur.xtra.neogit"
spec "ankur.xtra.wakatime"
spec "ankur.xtra.harpoon"
spec "ankur.xtra.codeium"
spec "ankur.xtra.ufo"
-- spec "ankur.xtra.supermaven"

spec "ankur.xtra.markview"
spec "ankur.xtra.obsidian"
spec "ankur.xtra.bufferline"
-- spec "ankur.xtra.gitsigns"
-- spec "ankur.xtra.miniai"
-- spec "ankur.xtra.tabnine"
-- spec "ankur.xtra.modicator"
spec "ankur.xtra.hlchunk"
spec "ankur.xtra.illuminate"
-- spec "ankur.xtra.yazi"
spec "ankur.xtra.colorizer"
spec "ankur.core.luarocks"
spec "ankur.xtra.img-clip"
spec "ankur.xtra.image"
spec "ankur.xtra.maximizer"
spec "ankur.xtra.ledger"
-- spec "ankur.xtra.lab"
-- spec "ankur.xtra.dadbod"
-- spec "ankur.xtra.cellular-automaton"
-- spec "ankur.xtra.flash"
-- spec "ankur.xtra.zenmode"
-- spec "ankur.xtra.twilight"
-- spec "ankur.xtra.dropbar"
spec "ankur.xtra.wilder"
-- spec "ankur.xtra.typr"

require "ankur.lazy"
