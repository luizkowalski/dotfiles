local plugins = {
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("custom.configs.null-ls")
      end,
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "lua-language-server",
          "html-lsp",
          "prettier",
          "stylua",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
  },
}

return plugins
