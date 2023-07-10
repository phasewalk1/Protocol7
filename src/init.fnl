(lambda bootstrap-lazy []
  (local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
  (if (not (vim.loop.fs_stat lazypath))
      (vim.fn.system [:git
		     :clone
		     :--filter=blob:none
		     :https://github.com/folke/lazy.nvim
		     :--branch=stable
		     lazypath]))
  (vim.opt.rtp:prepend lazypath))

(bootstrap-lazy)

(lambda extend-runtime-path []
  (local builds-path (.. (vim.fn.stdpath "config") "/build/?.lua"))
  (set package.path (.. package.path ";" builds-path)))

(extend-runtime-path)

(local globals (require :globals))
(local lazy (require :lazy))
(local plugins (require :plugins))
(lazy.setup plugins)
