(use-package ranger

  :general
  (my-leader :keymaps 'override
  "f d" '(ranger :wk "open ranger"))

  :custom
  (ranger-hide-cursor nil))
