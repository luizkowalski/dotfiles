local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup()

lspconfig.typos_lsp.setup({
  config = {
    -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
    cmd_env = { RUST_LOG = "error" }
  },
  init_options = {
    -- Custom config. Used together with any workspace config files, taking precedence for
    -- settings declared in both. Equivalent to the typos `--config` cli argument.
    -- config = '~/code/typos-lsp/crates/typos-lsp/tests/typos.toml',
    -- How typos are rendered in the editor, eg: as errors, warnings, information, or hints.
    -- Defaults to error.
    diagnosticSeverity = "Error"
  }
})
lspconfig.terraformls.setup {}
lspconfig.dockerls.setup {}
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
lspconfig.lua_ls.setup {}
-- lspconfig.bashls.setup {}
lspconfig.eslint.setup({
  packageManager = "yarn",
  on_attach = function(bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

lspconfig.ruby_ls.setup({
  on_attach = function(client, buffer)
    setup_diagnostics(client, buffer)
  end,
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
