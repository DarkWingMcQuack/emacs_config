(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  ;; Only select tree-sitter modes whose grammar is already available.
  (treesit-auto-add-to-auto-mode-alist)
  :hook
  (elpaca-after-init . global-treesit-auto-mode))
