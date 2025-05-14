(use-package dart-mode :mode "\\.dart\\'")

(use-package flutter
  :after dart-mode
  :general
  (my-leader
    :keymaps 'dart-mode-map
    :states 'normal
    "b x" '(flutter-run-or-hot-reload  :wk "hot reload")
    "p x" '(flutter-run                :wk "run project")))
