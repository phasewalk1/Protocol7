;; Extend the package.path to the 'build/' dir
(local builds-path (.. (vim.fn.stdpath "config") "/build/?.lua"))
(set package.path (.. package.path ";" builds-path))

;; Load global settings
(require :globals)

;; Boostrap lazy.nvim
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

;; Register plugins w/ lazy
(let [lazy (require :lazy)]
  (lazy.setup (require :plugins)))
