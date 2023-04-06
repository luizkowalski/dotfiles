local M = {}

-- Your custom mappings
M.abc = {
    n = {
        ["<C-o>"] = {":Telescope find_files <CR>", "Telescope Files"},
        ["<C-Left>"] = {"^ <CR>", "beginning of line"},
        ["<C-Right>"] = {"$ <CR>", "end of line"},
        ["q"] = {"<cmd> <leader> x <CR>", "Quit file"}
    },

    l = {

    }
}

return M
