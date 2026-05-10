(use-package visual-regexp
  :commands (vr/replace vr/query-replace))

(use-package visual-regexp-steroids
  :after visual-regexp
  :custom
  (vr/engine 'python)
  :general
  (my-leader
    :states 'normal
    "r r" '(vr/replace :wk "regexp replace")))
