(use-package scala-ts-mode
  :after eglot
  :mode "\\(scala\\|sbt\\|mill\\)$"
  :config
  (add-to-list 'eglot-server-programs
               `(scala-ts-mode . ("metals" "-Dmetals.client=emacs")))
  :hook
  (scala-ts-mode . eglot-ensure))
