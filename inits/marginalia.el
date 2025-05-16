(use-package marginalia
  :hook
  (elpaca-after-init . (lambda () (marginalia-mode)))
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center))
