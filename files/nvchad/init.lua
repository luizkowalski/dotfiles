local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    require("treesitter-context").enable()
  end,
})

-- copy whole file with command called :Y
-- Moved to mappings.lua
-- autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("command! -nargs=0 Y :%y+")
--   end,
-- })
