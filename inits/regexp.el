(use-package visual-regexp :defer t)
(use-package pcre2el :defer t)

(use-package visual-regexp-steroids
  :commands (vr/replace vr/query-replace)
  :defer t
  :after visual-regexp
  :custom
  (vr/engine 'pcre2el "Use PCRE regular expressions")
  :general
  (my-leader
    :states 'normal
    "r r" '(vr/replace :wk "regexp replace")))
