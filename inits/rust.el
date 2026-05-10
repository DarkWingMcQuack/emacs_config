(use-package rust-mode
  :defer t
  :hook
  (rust-mode . my/lsp-deferred))
