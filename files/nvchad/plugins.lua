local plugins = {
  {
    "echasnovski/mini.trailspace",
    version = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    opts = {
      ensure_installed = {
        "c",
        "ruby",
        "html",
        "javascript",
        "typescript",
        "json",
        "css",
        "embedded_template",
      },
    },
    lazy = true,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 150,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%d-%b-%Y> - <summary>",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettierd",
        "stylua",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    lazy = false,
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 50,
        },
      })
    end,
  },
  {
    "echasnovski/mini.cursorword",
    version = false,
    lazy = false,
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    --   dependencies = {
    --     {
    --       "zbirenbaum/copilot-cmp",
    --       config = function()
    --         require("copilot_cmp").setup()
    --       end,
    --       lazy = false,
    --     },
    --   },
    opts = {
      sources = {
        -- { name = "nvim_lsp" },
        -- { name = "luasnip" },
        { name = "buffer" },
        -- { name = "nvim_lua" },
        -- { name = "path" },
        { name = "copilot" },
      },
    },
  },
  {
    "rgroli/other.nvim",
    lazy = false,
    config = function()
      require("other-nvim").setup({
        mappings = {
          "rails",
        },
        rememberBuffers = false,
      })
    end,
  },
}

-- Not needed if installed Ripgrep, it picks up the config from .gitignore
-- require("telescope").setup({
--   defaults = {
--     file_ignore_patterns = { "node_modules", "sorbet" },
--   },
-- })

return plugins
