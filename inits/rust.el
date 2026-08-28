(use-package rust-mode
  :mode "\\.rs\\'"
  :hook
  ((rust-mode . my/lsp-deferred)
   (rust-ts-mode . my/lsp-deferred)))
