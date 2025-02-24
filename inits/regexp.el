(use-package visual-regexp)

(use-package pcre2el)

(use-package visual-regexp-steroids
  :after visual-regexp
  :custom
  (vr/engine 'pcre2el "Use PCRE regular expressions")
  :general
  (my-leader
    :states 'normal
    "r r" '(vr/replace :wk "regexp replace")))
