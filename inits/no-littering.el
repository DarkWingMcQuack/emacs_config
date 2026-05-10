(use-package no-littering
  :custom
  (custom-file (no-littering-expand-etc-file-name "custom.el"))

  :config
  (no-littering-theme-backups)
  (load custom-file 'noerror))
