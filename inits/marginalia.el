(use-package marginalia
  :preface
  (defun my/lazy-marginalia () (marginalia-mode))
  :hook
  (elpaca-after-init . my/lazy-marginalia)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center))
