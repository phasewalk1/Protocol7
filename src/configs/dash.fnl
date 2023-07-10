(lambda dash-opts []
  {:event "VimEnter"
   :config (fn []
             (local dashboard (require :dashboard))
             (local guts (require :configs.dash-guts))
             (dashboard.setup guts))
   :dependencies [ :nvim-tree/nvim-web-devicons ]})

(dash-opts)
