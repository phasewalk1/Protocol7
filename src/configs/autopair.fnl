(lambda autopair-opts []
  {:config (fn []
            (local autopairs (require "nvim-autopairs"))
            ((. autopairs :setup) {}))})

(autopair-opts)
