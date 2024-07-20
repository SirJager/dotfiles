local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "sindrets/diffview.nvim",
    "paopaol/telescope-git-diffs.nvim",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
}

function M.config()
  local telescope = require "telescope"
  local ok, _ = pcall(require, "flutter-tools")
  if ok then
    telescope.load_extension "flutter"
  end

  telescope.load_extension "project"
  telescope.load_extension "media_files"
  telescope.load_extension "emoji"
  telescope.load_extension "ui-select"
  telescope.load_extension "git_diffs"

  local actions = require "telescope.actions"
  local project_actions = require "telescope._extensions.project.actions"

  telescope.setup {
    defaults = {
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor/", "^.venv/" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    pickers = {
      oldfiles = {
        prompt_title = "Recent files",
        prompt_prefix = "   ",
        theme = "dropdown",
      },
      find_files = {
        prompt_title = "Find files",
        prompt_prefix = "   ",
        previewer = false,
        theme = "dropdown",
      },
      live_grep = {
        prompt_title = "Live grep",
        prompt_prefix = "   ",
        theme = "dropdown",
      },
      help_tags = {
        prompt_title = "Help tags",
        prompt_prefix = " 󰘥  ",
        theme = "dropdown",
      },
      colorscheme = {
        prompt_title = "Color schemes",
        prompt_prefix = "   ",
        theme = "dropdown",
        enable_preview = true,
      },
      keymaps = {
        prompt_title = "Key bindings",
        prompt_prefix = " 󰌓  ",
        theme = "dropdown",
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    mappings = {
      i = {
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["q"] = actions.close,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["?"] = actions.which_key,
      },
    },

    extensions_list = { "themes", "media_files", "projects", "terms", "fzf" },
    extensions = {
      ["ui-select"] = { require("telescope.themes").get_dropdown() },
      emoji = {
        action = function(emoji)
          vim.fn.setreg("*", emoji.value)
          print([[Press p or "*p to paste this emoji]] .. emoji.value)
          vim.api.nvim_put({ emoji.value }, "c", false, true)
        end,
      },
      projects = {
        base_dirs = {},
        display_type = "full",
        hidden_files = false, -- default: false
        theme = "dropdown",
        order_by = "asc",
        search_by = "title",
        sync_with_nvim_tree = true, -- default false
        on_project_selected = function(prompt_bufnr)
          project_actions.change_working_directory(prompt_bufnr, false)
          require("harpoon.ui").nav_file(1)
        end,
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      media_files = {
        filetypes = {
          "png",
          "webp",
          "jpg",
          "jpeg",
        },
        find_cmd = "rg", -- find command (defaults to `fd`)
      },
    },
  }
end

return M
