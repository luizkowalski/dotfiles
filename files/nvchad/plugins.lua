local plugins = {
  { "echasnovski/mini.trailspace", version = false },
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
        "prettier",
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
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    ops = { suggestion = {
      auto_trigger = true,
    } },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
        lazy = false
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot" },
      },
    },
  },
  -- {
  --   "echasnovski/mini.animate",
  --   version = false,
  --   lazy = false,
  --   config = function()
  --     require("mini.animate").setup()
  --   end,
  -- },
}

return plugins
