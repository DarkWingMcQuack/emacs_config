(use-package visual-regexp
  :commands (vr/replace vr/query-replace))

(use-package visual-regexp-steroids
  :after visual-regexp
  :custom
  (vr/engine (if (executable-find "python") 'python 'emacs))
  :general
  (my-leader
    :states 'normal
    "r r" '(vr/replace :wk "regexp replace")))
