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

(treesitter-opts)
