(use-package bnf-mode)

(define-generic-mode 'ebnf-mode
  '(("(*" . "*)"))
  '("=")
  '(("^[^ \t\n][^=]+" . font-lock-variable-name-face)
    ("['\"].*?['\"]" . font-lock-string-face)
    ("\\?.*\\?" . font-lock-negation-char-face)
    ("\\[\\|\\]\\|{\\|}\\|(\\|)\\||\\|,\\|;" . font-lock-type-face)
    ("[^ \t\n]" . font-lock-function-name-face))
  '("\\.ebnf\\'")
  `(,(lambda () (setq mode-name "EBNF")))
  "Major mode for EBNF metasyntax text highlighting.")

(provide 'ebnf-mode)
