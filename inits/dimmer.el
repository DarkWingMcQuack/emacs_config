(use-package dimmer
  :custom
  (dimmer-fraction 0.4)
  :config
  (dimmer-configure-magit)
  (dimmer-configure-company-box)
  (dimmer-configure-posframe)
  (dimmer-configure-which-key)
  :hook (elpaca-after-init . (lambda ()(dimmer-mode t))))
