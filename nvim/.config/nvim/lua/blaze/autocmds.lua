vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- text highlight when yanking
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 120 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "ledger" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "DashboardLoaded",
    callback = function()
      require("lazy").show()
      vim.opt.showtabline = 2
    end,
  })
end

vim.api.nvim_create_user_command("MasonInstallAll", function()
  local servers = require("blaze.plugins.mason").servers or {}
  local servers_str = table.concat(servers, " ")
  vim.cmd("MasonInstall " .. servers_str)
end, {})
