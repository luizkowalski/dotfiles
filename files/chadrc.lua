local M = {}

M.ui = {theme = 'penumbra_dark'}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.g.copilot_assume_mapped = true

return M

