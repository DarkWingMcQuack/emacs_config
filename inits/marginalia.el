(use-package marginalia
  :defer t
  :preface
  (defun my/lazy-marginalia () (marginalia-mode))
  :hook (after-init . my/lazy-marginalia)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center))
