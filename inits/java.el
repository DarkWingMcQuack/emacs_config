(use-package java-mode
  :ensure nil
  :config

  (add-to-list 'major-mode-remap-alist '(java-mode . java-ts-mode))

  :hook
  (java-ts-mode . lsp-deferred))
