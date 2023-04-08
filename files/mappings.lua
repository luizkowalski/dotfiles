local M = {}

-- Your custom mappings
M.custom = {
    n = {
        ["<C-o>"] = {":Telescope find_files <CR>", "Telescope Files"},
        ["<C-p>"] = {":Telescope git_files <CR>", "Telescope Files"},
        ["<C-z>"] = { "<cmd> undo <CR>", "Undo"},
        ["<leader>gs"] = { ":Telescope git_status <CR>", "git status"},
        ["<C-f>"] = { ":Telescope live_grep <CR>", "live grep"},
        ["<C-b>"] = { "<ESC>^i", "beginning of line" },
        ["<C-e>"] = { "<End>", "end of line" },
        ["q"] = {
          function()
            require("nvchad_ui.tabufline").close_buffer()
          end,
          "close buffer",
        },
      },

    i = { }
}

return M
