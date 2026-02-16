(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . lsp-defered))
