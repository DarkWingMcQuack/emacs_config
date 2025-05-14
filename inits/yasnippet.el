(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode)
  (text-mode . yas-minor-mode)

  :general
  (my-leader 'prog-mode-map
    :states 'normal
    "s n" '(yas-new-snippet :wk "new snipped")
    "s g" '(yas-visit-snippet-file :wk "goto snipped file")
    "s i" '(yas-insert-snippet :wk "insert snipped from list"))
  :config
  (yas-reload-all)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets")))
