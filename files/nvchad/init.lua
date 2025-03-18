local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    require("treesitter-context").enable()
    vim.cmd [[colorscheme moonfly]]
  end,
})
