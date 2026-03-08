-- stylua: ignore start

return {
  { "<leader>e",function()require("mini.files").open(vim.uv.cwd(),true)end,icon = "  ", desc = "[F]ile Manager" },
  { "<leader>r", "<CMD> Neotree toggle<CR>", icon = "  ", desc = "[F]ile Manager" },
  -- { "<leader>E", "<CMD> Neotree toggle<CR>", icon = "  ", desc = "[F]ile Manager" },
  { "<leader>v", "<CMD>PasteImage<CR>", icon = " ", desc = "[V]Paste Image" },

  -- { "<leader>m", group = "[M]acros", icon = "󰮋 " },
  -- { "<leader>mr", "qa", icon = " ", desc = "Record Macro" },
  -- { "<leader>ms", "q", icon = " ", desc = "Finish Record" },
  -- { "<leader>me", "@a", icon = " ", desc = "Execute Macro" },

  -- NOTE: Obsidian
  { "<leader>o", group = "[O]bsidian", icon = " " },
  { "<leader>od", "<CMD>ObsidianFollowLink<CR>", icon = " ", desc = "[F]llow Link" },
  { "<leader>ot", "<CMD>ObsidianTags<CR>", icon = " ", desc = "[T]ags List" },
  { "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", icon = " ", desc = "[O]pen Markdown" },
  { "<leader>ob", "<CMD>ObsidianBacklinks<CR>", icon = "󰿨 ", desc = "[B]ack Links" },
  { "<leader>ol", "<CMD>ObsidianLinks<CR>", icon = "󰿨 ", desc = "[L]inks List" },
  { "<leader>os", "<CMD>ObsidianSearch<CR>", icon = "󱎸 ", desc = "[S]earch Markdown" },
  { "<leader>oc", ":lua require'obsidian'.util.toggle_checkbox()<CR>", icon = " ", desc = "[C]heck Box" },
  { "<leader>oa", ":lua require'obsidian'.util.smart_action()<CR>", icon = " ", desc = "[A]ction Smart" },
  { "<leader>ov", "<CMD>ObsidianDebug<CR>", icon = " ", desc = "[V]erbose Obisidian" },

  -- NOTE: Base
  { "<leader>b", group = "[B]ase", icon = "" },
  { "<leader>bb", ":lua require('dbee').toggle()<CR>", icon = " ", desc = "[U]i Toggle" },
  { "<leader>bo", ":lua require('dbee').open()<CR>", icon = "", desc = "[O]pen Ui" },
  { "<leader>bc", ":lua require('dbee').close()<CR>", icon = " ", desc = "[C]lose Ui" },
  { "<leader>br", ":lua require('dbee').execute(", icon = "󱂅 ", desc = "[R]un query" },
  { "<leader>be", ":lua require('dbee').execute(", icon = "󱂅 ", desc = "[E]xecute query" },

  -- NOTE: Debugging
  { "<leader>d", group = "[D]ebugging", icon = " " },
  { "<leader>du", ":lua require('dapui').toggle()<CR>", icon = " ", desc = "[U]i Toggle" },
  { "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", icon = "", desc = "[B]reakpoint" },
  { "<leader>dc", ":lua require('dap').continue()<CR>", icon = " ", desc = "[C]ontinue Debug" },
  { "<leader>dl", ":lua require('dap').show_log()<CR>", icon = "󱂅 ", desc = "[L]og Debug" },
  { "<leader>dq", ":lua require('dap').terminate()<CR>", icon = " ", desc = "[Q]uit Debug" },
  { "<leader>di", ":lua require('dap').step_into()<CR>", icon = "󰶡", desc = "[I]nto Step" },
  { "<leader>dj", ":lua require('dap').step_over()<CR>", icon = "󰔰 ", desc = "[J]ump Step" },
  { "<leader>do", ":lua require('dap').step_out()<CR>", icon = "󰶣 ", desc = "[O]ut Step" },

  -- NOTE: Neo Tests
  { "<leader>n", group = "[N]eo Tests", icon = "󰙨" },
  { "<leader>np", ":Neotest summary<CR>", icon = "󰊹 ", desc = "[P]anel Summary" },
  { "<leader>nn", ':lua require("neotest").run.run()<CR>', icon = "󰊹 ", desc = "[N]earest Test" },
  { "<leader>na", ':lua require("neotest").run.attach()<CR>', icon = " ", desc = "[A]ttach Test" },
  { "<leader>nx", ':lua require("neotest").run.stop()<CR>', icon = "  ", desc = "[X]top Test" },
  { "<leader>nc", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', icon = "󰢪 ", desc = "[C]urrent File Test" },
  { "<leader>nd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', icon = " ", desc = "[D]ebugger Test" },
  { "<leader>ng", group = "[G]o Tests", icon = " " },
  { "<leader>ngn", ':lua require("dap-go").debug_test()<CR>', icon = "󰊹 ", desc = "[G]o [N]earest Test" },
  { "<leader>ngl", ':lua require("dap-go").debug_last()<CR>', icon = "󰎔 ", desc = "[G]o [L]ast Test" },

  -- NOTE: Golang
  { "<leader>g", group = "[G]olang", icon = " " },
  { "<leader>gt", ":GoAddTag ", icon = "󰜢 ", desc = "[T]ags Add" },
  { "<leader>gx", ":GoRmTag ", icon = "󱈠 ", desc = "[X]Remove Tags" },
  { "<leader>gj", ":GoAddTag json -transform camelcase<CR>", icon = " ", desc = "[J]son Tags" },
  { "<leader>gb", ":GoAddTag bson -transform camelcase<CR>", icon = "󰨥 ", desc = "[B]son Tags" },
  { "<leader>gy", ":GoAddTag yaml -transform camelcase<CR>", icon = " ", desc = "[Y]aml Tags" },
  { "<leader>gm", ":GoAddTag toml -transform camelcase<CR>", icon = " ", desc = "To[M]aml Tags" },
  { "<leader>gd", ":GoAddTag validate<CR>", icon = " ", desc = "[D]ata Validate" },
  { "<leader>ge", ":GoIfErr<CR>", icon = " ", desc = "[E]rror Check" },
  { "<leader>gf", ":GoFixPlurals<CR>", icon = "󰁨 ", desc = "[F]ix Plurals" },
  { "<leader>gr", ":GoRun ./cmd<CR>", icon = " ", desc = "[R]un Code" },
  { "<leader>gs", ":GoStop<CR>", icon = " ", desc = "[S]top Code" },
  { "<leader>gg", ":GoModTidy<CR>", icon = "󰿞 ", desc = "[G]o Mod Tidy" },
  { "<leader>gv", ":GoModVendor<CR>", icon = "󰕳 ", desc = "[V]endor Mod" },
  { "<leader>gi", ":GoImpl<CR>", icon = "󰰃 ", desc = "[I]plement Interface" },
  { "<leader>gl", ":GoToggleInlay<CR>", icon = "󰰃 ", desc = "In[L]ay Toggle" },

  -- -- require('snacks') Picker | Telescope replacement
  -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  {"<leader>s", group = "[S]earch", icon = " " },
  {"<leader>ss",function()require('snacks').picker.files({layout="ivy",regex=true,hidden=true,dirs={vim.fn.getcwd()},})end,desc = "[s]earch files"},
  {"<leader>sr",function()require('snacks').picker.resume({layout="ivy",})end,desc = "[r]esume search" },
  {"<leader>sl",function()require('snacks').picker.lines()end,icon="󱎸 ", desc = "[l]lines search" },
  {"<leader>sb",function()require('snacks').picker.buffers({layout="ivy",})end,icon = "󱎸 ",desc = "[b]buffers"},
  {"<leader>so",function()require('snacks').picker.recent({layout="ivy"})end,icon = " ",desc = "[o]pen recent"},
  {"<leader>sw",function()require('snacks').picker.grep({regex=true,hidden=true,dirs={vim.fn.getcwd()},layout = "ivy"})end, icon = "󰨭 ", desc = "grep" },
  {"<leader>sW",function()require('snacks').picker.grep_word()end, icon = "󰨭 ", desc = "[W]ord grep" },
  {"<leader>sk",function()require('snacks').picker.keymaps({layout='default'})end, icon = " ", desc = "[k]eymaps" },
  {"<leader>sg",function()require('snacks').lazygit.open()end, icon = " ", desc = "Lazy[g]it" },
  {"<leader>sG",function()require('snacks').lazygit.log()end, icon = " ", desc = "[G]itlog" },
  {"<leader>sm",function()require('snacks').picker.marks()end, icon=" ", desc = "[m]arks" },
  {"<leader>sf",function()require('snacks').picker.qflist()end,icon="󱖫 ", desc = "[f]ix list" },
  {"<leader>sp",function()require('snacks').picker.projects()end,icon=" ",desc = "[p]rojects" },
  {"<leader>sc",function()require('snacks').picker.colorschemes({layout="ivy"})end,icon=" ",desc = "[c]olorschemes" },
  {"<leader>sM",function()require('snacks').picker.man()end,icon="󱔗 ",desc = "[m]an pages" },
  {"<leader>sR",function()require('snacks').picker.registers({layout="ivy"})end, icon=" ", desc = "[R]registers" },
  {"<leader>sj",function()require('snacks').picker.jumps()end,icon="󱔕", desc = "[j]umps" },
  {"<leader>sh",function()require('snacks').picker.command_history()end,icon=" ", desc = "[h]istory" },
  {"<leader>st",function()require('snacks').picker.todo_comments({layout="default"})end,icon=" ", desc = "[t]odos" },
  {"<leader>sT",function()require('snacks').picker.todo_comments({keywords=require('plugins.comments').todo_keywords()}) end, desc = "[T]odo comments" },
  {"<leader>si",function()require('snacks').picker.icons({layout="default"}) end, desc = "icons emojis" },

  -- NOTE: LSP & Diagnostic
  { "<leader>l", group = "[L]SP [D]iagnostic", icon = " " },
  { "<leader>lv", ":LspInfo<CR>", icon = " ", desc = "[V]erbose" },
  { "<leader>lr", ":LspRestart<CR>", icon = " ", desc = "[R]estart" },
  { "<leader>ld", ":Lspsaga show_workspace_diagnostics<CR>", icon = " ", desc = "[W]orkspace" },
  { "<leader>ll", ":Lspsaga show_buf_diagnostics<CR>", icon = " ", desc = "[B]uf" },
  { "<leader>lj", ":Lspsaga diagnostic_jump_next<CR>", icon = " ", desc = "[J]ump" },
  { "<leader>lk", ":Lspsaga diagnostic_jump_prev<CR>", icon = " ", desc = "[K]Prev" },
  { "<leader>lc", ":Lspsaga show_cursor_diagnostics<CR>", icon = " ", desc = "[C]ursor" },
  { "<leader>lo", ":lua vim.diagnostic.enable(false)<CR>", icon = " ", desc = "[O]ff" },
  { "<leader>ln", ":lua vim.diagnostic.enable(true)<CR>", icon = " ", desc = "O[N]" },
  { "<leader>li", ":Lspsaga incoming_calls<CR>", icon = " ", desc = "[I]ncoming calls" },

  -- Flash
  { "<leader>f", group = "[F]lash", icon = " " },
  {"<leader>fj",function()require("flash").jump()end,icon = " ",desc = "[J]ump To"},
  {"<leader>ft",function()require("flash").treesitter()end,icon = " ",desc = "[T]reesitter"},
  {"<leader>fs",function()require("flash").treesitter_search()end,icon = " ",desc = "[S]earch Treesitter"},

   -- NOTE: Toggle Keys
  { "<leader>t", group = "[T]oggle", icon = "󰊹 " },
  { "<leader>td",function()require('snacks').toggle.dim()end, icon = "", desc = "[D]im" },
  {"<leader>ts","<CMD>ToggleSpellChecker<CR>",icon = "暈",desc = function()return "Spell Checker: " .. (vim.opt.spell:get() and "Disable" or "Enable")end},
  { "<leader>tk", "<CMD>Screenkey<CR>", icon = " ", desc = "Screen[k]eys" },
  { "<leader>th", "<ESC><ESC>:noh<CR>", icon = " ", desc = "[h]ighlights" },
  { "<leader>tt", "<CMD>Typr<CR>", icon = " ", desc = "[T]ypist" },
  { "<leader>ty", "<CMD>TyprStats<CR>", icon = " ", desc = "T[y]pist Stats" },
  -- { "<leader>tz", ":TSToolsOrganizeImports<CR>", icon = "󰒺 ", desc = "[T]ypescript [O]rganize Imports" },
  -- -- Tools:Lab
  -- { "<leader>tl", group = "[L]ab", icon = "󰤑 " },
  -- { "<leader>tlr", ":Lab code run<CR>", icon = " ", desc = "[R]un Code" },
  -- { "<leader>tls", ":Lab code stop<CR>", icon = " ", desc = "[S]top Code" },
  -- { "<leader>tlp", ":Lab code panel<CR>", icon = "󱗄 ", desc = "[P]anel Show" },
  -- { "<leader>tlc", ":Lab code config<CR>", icon = " ", desc = "[C]onfig Lab" },
  -- -- Tools:LiveServer
  -- { "<leader>ts", group = "[S]erver Live", icon = " " },
  -- { "<leader>tsi", ":LiveServerInstall<CR>", icon = "󰏔 ", desc = "[I]install Server" },
  -- { "<leader>tsr", ":LiveServerStart<CR>", icon = " ", desc = "[R]un Live Server" },
  -- { "<leader>tss", ":LiveServerStop<CR>", icon = " ", desc = "[S]top Live Server" },

  -- Marks
  { "<leader>m", group = "[M]ark", icon = "󱘈" },
  {"<leader>mm",":lua require('globals.utils').mark_cmd('m')<CR>",icon = " ",desc = "Set new [m]ark"},
  {"<leader>mM",":lua require('globals.utils').mark_cmd('`')<CR>",icon = "󰓘 ",desc = "Jump to [M]ark"},
  {"<leader>md",":lua require('globals.utils').mark_cmd('delmarks')<CR>",icon = "󰆴 ",desc = "Delete [M]ark"},
  {"<leader>mx","lua require('globals.utils').mark_cmd('delmarks!')<CR>",icon = "󰗩 ",desc = "Delete all [M]arks"},


  -- Ai 
  { "<leader>i", group = "Cop[i]lot", icon = "󱘈" },
  {"<leader>ii",":CopilotChat<CR>",icon = " ",desc = "Chat Open"},
  {"<leader>ix",":CopilotChatClose<CR>",icon = " ",desc = "Chat [X]lose"},
  {"<leader>ic",":CopilotChatCommit<CR>",icon = " ",desc = "Chat [C]omit"},
  {"<leader>id",":CopilotChatDocs<CR>",icon = " ",desc = "Chat [D]ocs"},
  {"<leader>ie",":CopilotChatCommit<CR>",icon = " ",desc = "Chat [E]xplain"},
  {"<leader>if",":CopilotChatCommit<CR>",icon = " ",desc = "Chat [F]ix"},
  {"<leader>il",":CopilotChatCommit<CR>",icon = " ",desc = "Chat [L]oad"},
}

-- stylua: ignore end
