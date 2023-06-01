local M = {}

M.ui = {
  theme = "github_dark",
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

vim.g.copilot_assume_mapped = true

-- Set Dockerfile.web file type to dockerfile
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "Dockerfile.*",
--   callback = function()
--     vim.b.filetype = "dockerfile"
--   end
-- })

vim.filetype.add({
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
  },
})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "Dockerfile.*",
--   callback = function()
--     set ft="dockerfile"
--   end,
-- })

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

return M
