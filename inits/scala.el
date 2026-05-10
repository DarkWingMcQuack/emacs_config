(use-package scala-ts-mode
  :preface
  (defun my/scala-lsp-deferred ()
    (require 'lsp-metals)
    (my/lsp-deferred))

  :mode "\\(scala\\|sbt\\|mill\\)$"
  :hook
  (scala-ts-mode . my/scala-lsp-deferred))

(use-package lsp-metals
  :after lsp-mode
  :custom
  (lsp-metals-server-args '("-Dmetals.client=emacs" "-Dmetals.http=on")))
