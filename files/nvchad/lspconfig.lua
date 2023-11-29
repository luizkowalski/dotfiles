local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

lspconfig.dockerls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.bashls.setup {}
lspconfig.eslint.setup({
  packageManager = "yarn",
  on_attach = function(bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lspconfig.ruby_ls.setup({
  cmd = { "ruby-lsp" },
  -- enabledFeatures = { "codeActions", "diagnostics", "documentHighlights", "documentSymbols", "formatting", "inlayHint" },
  -- on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    formatter = "auto",
  },
})

-- lspconfig.sorbet.setup({
--   cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
-- })

lspconfig.tailwindcss.setup({
  cmd = { "./node_modules/.bin/tailwindcss-language-server", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    -- "javascript",
    -- "javascriptreact",
    -- "typescript",
    -- "typescriptreact",
    "vue",
    "erb",
    "eruby",
    "postcss",
    "svelte",
  },
})
