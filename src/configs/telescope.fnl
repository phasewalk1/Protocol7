(lambda telescope-guts []
    {:border {}
     :borderchars ["─" "│" "─" "│" "╭" "╮" "╯" "╰"]
     :buffer_previewer_marker (. (require :telescope.previewers) :buffer_previewer_marker)
     :color_devicons true
     :entry_prefix " "
     :file_ignore_patterns [:node_modules]
     :file_previewer (. (. (require :telescope.previewers) :vim_buffer_cat) :new)
     :file_sorter (. (require :telescope.sorters) :get_fuzzy_file)
     :generic_sorter (. (require :telescope.sorters) :get_generic_fuzzy_sorter)
     :grep_previewer (. (. (require :telescope.previewers)
                         :vim_buffer_vimgrep)
                          :new)
     :initial_mode :insert
     :layout_config {:height 0.8
                     :horizontal {:preview_width 0.55
                                  :prompt_position :top
                                  :results_width 0.8}
                     :preview_cutoff 120
                     :vertical {:mirror false}
                     :width 0.87}
    :layout_strategy :horizontal
    :mappings {:n {:q (. (require :telescope.actions) :close)}}
    :path_display [:truncate]
    :prompt_prefix "   "
    :qflist_previewer (. (. (require :telescope.previewers)
                            :vim_buffer_qflist)
                         :new)
    :selection_caret "  "
    :selection_strategy :reset
    :set_env {:COLORTERM :truecolor}
    :sorting_strategy :ascending
    :vimgrep_arguments [:rg
                        :-L
                        :--color=never
                        :--no-heading
                        :--with-filename
                        :--line-number
                        :--column
                        :--smart-case]
    :winblend 0})

(lambda telescope-opts []
    {1 :nvim-telescope/telescope.nvim
              :cmd :Telescope
              :config (fn [_ opts]
                        (local telescope (require :telescope))
                        (telescope.setup opts))
              :dependencies [:nvim-treesitter/nvim-treesitter :nvim-lua/plenary.nvim]
              :opts (fn [] (telescope-guts))})

(telescope-opts)
