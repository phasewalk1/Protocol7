(local conjure-opts (require "configs.conjure"))
(local treesitter-opts (require "configs.treesitter"))
(local mason-opts (require "configs.mason"))
(local theme-opts (require "configs.theme"))
(local lsp-opts (require "configs.lsp"))

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

(lambda plugins []
  (let [plug {}]
    (push-plugin "folke/neoconf.nvim" {:cmd "Neoconf"} plug)
    (push-plugin "olical/conjure" conjure-opts plug)
    (push-plugin "nvim-treesitter/nvim-treesitter" treesitter-opts plug)
    (push-plugin "williamboman/mason.nvim" mason-opts plug)
    (push-plugin "nyoom-engineering/oxocarbon.nvim" theme-opts plug)
    (push-plugin "neovim/nvim-lspconfig" lsp-opts plug)
    (push-plugin "folke/neodev.nvim" {} plug)
    (push-plugin "folke/which-key.nvim" {} plug)
  plug))

(set vim.g.maplocalleader ",")
(plugins)

