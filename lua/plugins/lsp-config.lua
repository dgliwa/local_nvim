---@type LazySpec
return {
  {
    "nvim-lspconfig",
    config = function()
      lspconfig = require("lspconfig")
      lspconfig.ruby_lsp.setup {
        cmd = { "/Users/derek.gliwa/.rbenv/shims/ruby-lsp" },
      }
    end
  }
}
