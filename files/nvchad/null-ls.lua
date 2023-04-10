local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

local sources = {
  formatting.stylua,
  formatting.htmlbeautifier,
  formatting.prettier,
  formatting.jq,
  hover.printenv,
  hover.dictionary,
  diagnostics.eslint,
  diagnostics.yamllint,
  -- diagnostics.shellcheck,
  -- diagnostics.rubocop.with ( { command = "bundle", args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" } } ),
}

null_ls.setup({
  -- debug = true,
  sources = sources,
})
