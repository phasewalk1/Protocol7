(lambda bootstrap-lsp-opts []
  (local lspconfig (require "lspconfig"))
  ((. lspconfig.pyright :setup) {}))

(bootstrap-lsp-opts)

