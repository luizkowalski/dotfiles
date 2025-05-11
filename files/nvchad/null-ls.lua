local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

local sources = {
  -- formatting.tidy,
  -- formatting.jq,
  -- formatting.prettier,
  -- formatting.shellharden,
  formatting.stylua,
  -- diagnostics.eslint,
  diagnostics.hadolint,
  -- diagnostics.shellcheck,
  -- diagnostics.yamllint,
  hover.dictionary,
  hover.printenv,
}

null_ls.setup({
  -- debug = true,
  sources = sources,
})
