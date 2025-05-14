(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :custom
  (hl-todo-highlight-punctuation ":")
  (hl-todo-keyword-faces
   `(("TODO"       warning bold)
     ("FIXME"      error bold)
     ("HACK"       font-lock-constant-face bold)
     ("DEPRECATED" error italic))))
