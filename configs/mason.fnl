(lambda mason-ui []
  {:ui {:icons {:package_installed "✓"
	        :package_pending "➜"
	        :package_uninstalled "✗"}}})

(lambda mason-opts []
  {:opts {:ensure_installed [:pyright :rust-analyzer: :typescript-language-server]
	 :max_concurrent_installers 10
	 :PATH "skip"
	 :ui (mason-ui)}})

(mason-opts)
