local M = {}

M.ui = {
  theme = "mountain",
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

vim.g.copilot_assume_mapped = true

vim.filetype.add({
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
    ["Brewfile"] = "ruby",
    [".aliases"] = "bash",
    [".functions"] = "bash"
  },
})

-- Startup configurations
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
    require("treesitter-context").enable()
  end,
})

return M
