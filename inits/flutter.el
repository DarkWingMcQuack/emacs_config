(use-package dart-mode
  :preface
  (defun my/dart-lsp-deferred ()
    (require 'lsp-dart)
    (my/lsp-deferred))

  :mode "\\.dart\\'"
  :hook (dart-mode . my/dart-lsp-deferred))

(use-package lsp-dart
  :after lsp-mode)

(use-package flutter
  :after dart-mode
  :general
  (my-leader
    :keymaps 'dart-mode-map
    :states 'normal
    "b x" '(flutter-run-or-hot-reload :wk "hot reload")
    "p x" '(flutter-run               :wk "run project")))
