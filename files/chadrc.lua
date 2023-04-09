local M = {}

M.ui = {
    theme = 'onenord'
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.g.copilot_assume_mapped = true

vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
        require("nvim-tree.api").tree.open()
    end
})

return M
