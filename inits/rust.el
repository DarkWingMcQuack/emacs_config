(use-package rust-mode
  :mode "\\.rs\\'"
  :hook
  (rust-mode . my/lsp-deferred))
