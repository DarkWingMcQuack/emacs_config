(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs (remove 'scala treesit-auto-langs))
  ;; Only select tree-sitter modes whose grammar is already available.
  (treesit-auto-add-to-auto-mode-alist)
  :hook
  (elpaca-after-init . global-treesit-auto-mode))
