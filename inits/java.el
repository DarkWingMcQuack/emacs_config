(use-package java-ts-mode
  :ensure nil
  :hook
  ((java-mode . my/lsp-deferred)
   (java-ts-mode . my/lsp-deferred)))
