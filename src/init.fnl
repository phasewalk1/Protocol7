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

(local lazy (require :lazy))
(local plugins (require :presentday))
(lazy.setup plugins)
