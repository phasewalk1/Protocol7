;; Table for plugins
(local plug {})

;; Add a plugin to the table
(lambda push-plugin [identifier opts]
  (if (= opts {})
    (table.insert plug identifier)
    (do
      (let [plugin-spec {}]
        (table.insert plugin-spec identifier)
        (each [k v (pairs opts)]
          (tset plugin-spec k v))
        (table.insert plug plugin-spec)))))

;; Define plugins
(lambda plugins []
    (push-plugin "folke/neoconf.nvim"               {:cmd "Neoconf"})
    (push-plugin "olical/conjure"                   (require :configs.conjure))
    (push-plugin "nvim-treesitter/nvim-treesitter"  (require :configs.treesitter))
    (push-plugin "williamboman/mason.nvim"          (require :configs.mason))
    (push-plugin "nyoom-engineering/oxocarbon.nvim" (require :configs.theme))
    (push-plugin "neovim/nvim-lspconfig"            (require :configs.lsp))
    (push-plugin "windwp/nvim-autopairs"            (require :configs.autopair))
    (push-plugin "glepnir/dashboard-nvim"           (require :configs.dash))
    (push-plugin "nvim-telescope/telescope.nvim"    (require :configs.telescope))
    (push-plugin "folke/neodev.nvim"                {})
    (push-plugin "folke/which-key.nvim"             {})
  plug)

;; Export the plugins
(plugins)
