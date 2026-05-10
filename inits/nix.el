(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . my/lsp-deferred))
