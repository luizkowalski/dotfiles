local plugins = {
  { "github/copilot.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
}

require'lspconfig'.ruby_ls.setup{}

return plugins

