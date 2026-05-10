(use-package no-littering
  :ensure (:wait t)
  :custom
  (custom-file (no-littering-expand-etc-file-name "custom.el"))

  :config
  (no-littering-theme-backups)
  (load custom-file 'noerror))
