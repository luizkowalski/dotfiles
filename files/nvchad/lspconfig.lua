local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

lspconfig.ruby_ls.setup({
  cmd = { "bundle", "exec", "ruby-lsp" },
  enabledFeatures = { "codeActions", "diagnostics", "documentHighlights", "documentSymbols", "formatting", "inlayHint" },
  -- on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    formatter = "auto",
  },
})

lspconfig.sorbet.setup({
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
})

lspconfig.tailwindcss.setup({
  cmd = { "./node_modules/.bin/tailwindcss-language-server", "--stdio" },
  on_attach = on_attach,
  capabilities = capabilities,
})
