(defun untabify-except-makefiles ()
  "Replace tabs with spaces except in makefiles."
  (unless (derived-mode-p 'makefile-mode)
    (untabify (point-min) (point-max))))

(use-package whitespace-cleanup-mode
  :config
  (add-hook 'before-save-hook (lambda () (untabify-except-makefiles)))
  (global-whitespace-cleanup-mode)
  (setq-default indent-tabs-mode nil)
  :custom
  (tab-width 4)
  (show-trailing-whitespace t))
