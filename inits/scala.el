(use-package scala-mode
  :preface
  (defun my/scala-lsp-deferred ()
    (require 'lsp-metals)
    (my/lsp-deferred))

  :mode "\\.\\(scala\\|sbt\\|mill\\)\\'"
  :hook
  (scala-mode . my/scala-lsp-deferred))

(use-package lsp-metals
  :custom
  (lsp-metals-multi-root nil)
  (lsp-metals-server-args '("-Dmetals.client=emacs" "-Dmetals.http=on")))
