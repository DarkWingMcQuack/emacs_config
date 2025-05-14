(use-package gcmh
  :custom
  (gcmh-high-cons-threshold (* 50 1024 1024))

  :hook
  (elpaca-after-init . (lambda () (gcmh-mode))))
