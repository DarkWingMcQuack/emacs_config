(use-package dimmer
  :custom
  (dimmer-fraction 0.4)
  :hook (elpaca-after-init . (lambda ()(dimmer-mode t))))
