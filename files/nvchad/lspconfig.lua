local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

lspconfig.typos_lsp.setup({
  config = {
    -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
    cmd_env = { RUST_LOG = "error" },
  },
  init_options = {
    -- Custom config. Used together with any workspace config files, taking precedence for
    -- settings declared in both. Equivalent to the typos `--config` cli argument.
    -- config = '~/code/typos-lsp/crates/typos-lsp/tests/typos.toml',
    -- How typos are rendered in the editor, eg: as errors, warnings, information, or hints.
    -- Defaults to error.
    diagnosticSeverity = "Error",
  },
})
lspconfig.terraformls.setup({})
lspconfig.dockerls.setup({})
-- lspconfig.yamlls.setup {
--   on_attach = on_attach,
--   capabilities = {
--     textDocument = {
--       foldingRange = {
--         dynamicRegistration = false,
--         lineFoldingOnly = true,
--       },
--     },
--   },
--   settings = {
--     redhat = { telemetry = { enabled = false } },
--     yaml = {
--       keyOrdering = false,
--       format = {
--         enable = true,
--       },
--       validate = true
--     }
--   }
-- }
lspconfig.lua_ls.setup({})
lspconfig.bashls.setup({})
lspconfig.eslint.setup({
  packageManager = "bun",
  on_attach = function(bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = "auto",
    linters = { "rubocop" },
  },
})

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
    -- "vue",
    "erb",
    "eruby",
    "postcss",
    -- "svelte",
  },
})
