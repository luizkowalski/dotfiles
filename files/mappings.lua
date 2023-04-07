local M = {}

-- Your custom mappings
M.abc = {
    n = {
        ["<C-o>"] = {":Telescope find_files <CR>", "Telescope Files"},
        ["<C-z>"] = { "<cmd> undo <CR>", "Undo"},
        ["q"] = {"<cmd> <leader> x <CR>", "Quit file"}
    },

    l = {

    }
}

return M
