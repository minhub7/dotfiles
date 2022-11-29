local status, _ = pcall(require, "lspconfig")
if not status then
  return
end

require "lsp.mason"
require("lsp.handlers").setup()
require "lsp.null-ls"
