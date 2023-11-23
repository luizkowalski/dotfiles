local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

local sources = {
  formatting.htmlbeautifier,
  formatting.jq,
  formatting.prettier,
  formatting.shellharden,
  formatting.stylua,
  -- diagnostics.eslint,
  diagnostics.hadolint,
  diagnostics.shellcheck,
  -- diagnostics.rubocop.with ( { command = "bundle", args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" } } ),
  diagnostics.yamllint,
  hover.dictionary,
  hover.printenv,
}

null_ls.setup({
  -- debug = true,
  sources = sources,
})
