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

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return plugins
