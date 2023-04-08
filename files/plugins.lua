local plugins = {
  { "github/copilot.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
}

require('lspconfig').ruby_ls.setup{}

return plugins

