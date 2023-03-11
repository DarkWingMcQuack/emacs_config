(use-package visual-regexp)

(use-package pcre2el)

(use-package visual-regexp-steroids
  :commands (vr/replace vr/query-replace)
  :after visual-regexp
  :general
  (my-leader
    :states 'normal
    "r r" '(vr/replace :wk "regexp replace")))
