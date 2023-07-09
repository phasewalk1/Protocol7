(lambda push-plugin [identifier opts tbl]
  (if (= opts {})
    (table.insert tbl identifier)
    (do
      (let [plugin-spec {}]
        (table.insert plugin-spec identifier)
        (each [k v (pairs opts)]
          (tset plugin-spec k v))
        (table.insert tbl plugin-spec))))
  tbl)

(lambda conjure-opts []
  {:config (fn []
	    (set vim.g.conjure#filetype#fennel "conjure.client.fennel.stdio"))
  :lazy false})

(lambda treesitter-opts-guts []
  {:ensure_installed [:lua :fennel :rust 
		      :c :python :go]
  :highlight {:enable true 
  	      :use_languagetree true}
  :indent {:enable true}})

(lambda treesitter-opts []
  {:config (fn []
	    (let [ts (require "nvim-treesitter.configs")]
	      (ts.setup (treesitter-opts-guts))))})

(lambda mason-ui []
  {:ui {:icons {:package_installed "✓"
	        :package_pending "➜"
	        :package_uninstalled "✗"}}})

(lambda mason-opts []
  {:opts {:ensure_installed [:pyright :rust-analyzer: :typescript-language-server]
	 :max_concurrent_installers 10
	 :PATH "skip"
	 :ui (mason-ui)}})

(lambda oxocarbon-opts []
  {:config (fn []
	    (vim.cmd "colorscheme oxocarbon"))
  :lazy false})

(lambda plugins []
  (let [plug {}]
    (push-plugin "folke/neoconf.nvim" {:cmd "Neoconf"} plug)
    (push-plugin "olical/conjure" (conjure-opts) plug)
    (push-plugin "nvim-treesitter/nvim-treesitter" (treesitter-opts) plug)
    (push-plugin "williamboman/mason.nvim" (mason-opts) plug)
    (push-plugin "nyoom-engineering/oxocarbon.nvim" (oxocarbon-opts) plug)
    (push-plugin "neovim/nvim-lspconfig" {} plug)
    (push-plugin "folke/neodev.nvim" {} plug)
    (push-plugin "folke/which-key.nvim" {} plug)
  plug))

(set vim.g.maplocalleader ",")
(plugins)

