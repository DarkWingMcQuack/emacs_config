(use-package marginalia
  :hook
  (elpaca-after-init . (lambda () (marginalia-mode 1)))
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center))
