(lambda bootstrap-lsp-opts []
  {:config (fn []
	     (local lspconfig (require "lspconfig"))
	     ((. lspconfig.pyright :setup) {}))
  :lazy false})

(bootstrap-lsp-opts)
