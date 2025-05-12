-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "html",
  "jsonls",
  "stimulus_ls",
  "terraformls",
  "turbo_ls",
  "yamlls",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

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
