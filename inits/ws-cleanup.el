(defun untabify-except-makefiles ()
  "Replace tabs with spaces except in makefiles."
  (unless (derived-mode-p 'makefile-mode)
    (untabify (point-min) (point-max))))

(use-package whitespace-cleanup-mode
  :config
  (add-hook 'before-save-hook (lambda () (untabify-except-makefiles)))
  (custom-set-variables
   '(tab-width 4))
  (setq-default indent-tabs-mode nil)
  (global-whitespace-cleanup-mode))
