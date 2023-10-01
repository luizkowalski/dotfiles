local M = {}

M.ui = {
  theme = "doomchad",
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

vim.g.copilot_assume_mapped = true

vim.filetype.add({
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
    ["Brewfile"] = "ruby",
  },
})

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

return M
