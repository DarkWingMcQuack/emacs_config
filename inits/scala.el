(use-package scala-ts-mode
  :mode "\\(scala\\|sbt\\|mill\\)$"
  :hook
  (scala-ts-mode . lsp-deferred))
