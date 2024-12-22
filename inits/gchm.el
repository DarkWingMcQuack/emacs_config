(use-package gcmh
  :custom
  (gcmh-high-cons-threshold (* 1024 1024 1024))
  :config
  (add-hook 'after-init-hook (lambda () (gcmh-mode))))
