local M = {}

-- Your custom mappings
M.custom = {
    n = {
        ["<C-o>"] = {":Telescope find_files <CR>", "Telescope Files"},
        ["<C-z>"] = { "<cmd> undo <CR>", "Undo"},
        ["q"] = {"<cmd> <leader> x <CR>", "Quit file"},
        ["<leader>gs"] = { ":Telescope git_status <CR>", "git status"},
        ["<C-f>"] = { ":Telescope live_grep <CR>", "live grep"}
    },

    l = {

    }
}

return M
