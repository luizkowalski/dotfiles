local plugins = {
  {
    "echasnovski/mini.trailspace",
    version = false,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "prabirshrestha/tv.vim",
    lazy = false,
  },
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "weizheheng/ror.nvim",
    lazy = false,
    config = function()
      require("ror").setup()
    end,
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    lazy = false,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      -- view = { adaptive_size = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    opts = {
      ensure_installed = {
        "c",
        "css",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "ruby",
        "sql",
        "terraform",
        "typescript",
        "vim",
        "yaml",
      },
    },
    lazy = true,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("custom.configs.lspconfig")
    end,
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
        },
      },
    },
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
        "terraform-ls",
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
    opts = {
      sources = {
        -- { name = "nvim_lsp" },
        -- { name = "luasnip" },
        -- { name = "buffer" },
        -- { name = "nvim_lua" },
        -- { name = "path" },
        -- { name = "copilot" },
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
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
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
