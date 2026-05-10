(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode)
  (text-mode . yas-minor-mode)

  :general
  (my-leader 'prog-mode-map
    :states 'normal
    "s n" '(yas-new-snippet :wk "new snippet")
    "s g" '(yas-visit-snippet-file :wk "go to snippet file")
    "s i" '(yas-insert-snippet :wk "insert snippet"))
  :config
  (yas-reload-all)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets")))
