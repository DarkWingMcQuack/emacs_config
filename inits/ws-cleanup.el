(defun untabify-except-makefiles ()
  "Replace tabs with spaces except in makefiles."
  (unless (derived-mode-p 'makefile-mode)
    (untabify (point-min) (point-max))))

(use-package whitespace-cleanup-mode
  :custom
  (tab-width 4)
  (show-trailing-whitespace t)

  :config
  (add-hook 'before-save-hook (lambda () (untabify-except-makefiles)))
  (global-whitespace-cleanup-mode)
  (setq-default indent-tabs-mode nil)

  (dolist (hook '(special-mode-hook
                  term-mode-hook
                  comint-mode-hook
                  compilation-mode-hook
                  minibuffer-setup-hook))
    (add-hook hook (lambda () (setq show-trailing-whitespace nil))))

  )
