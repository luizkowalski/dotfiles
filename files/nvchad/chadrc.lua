local M = {}

M.ui = {
  theme = "tokyodark",
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

vim.g.copilot_assume_mapped = true

vim.filetype.add({
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
    ["Brewfile"] = "ruby",
    [".aliases"] = "bash",
    [".functions"] = "bash",
  },
})

return M
