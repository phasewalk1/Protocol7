(fn conjure-opts []
  {:config (fn []
        (set vim.g.conjure#filetype#fennel "conjure.client.fennel.stdio"))
  :lazy false})

(conjure-opts)
