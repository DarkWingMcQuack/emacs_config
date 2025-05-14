(use-package rust-mode
  :defer t
  :after eglot
  :hook
  (rust-mode . eglot-ensure))
