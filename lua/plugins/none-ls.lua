-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  config = function()
    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"
    null_ls = require("null-ls")
    null_ls.builtins.formatting.rubocop.with({
      only_local = '/Users/derek.gliwa/.rbenv/shims/rubocop'
    })
    -- null_ls.setup {
    --   { name = "rubocop", filetypes = "ruby" }
    -- }

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  end,
}
