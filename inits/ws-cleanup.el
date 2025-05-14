(use-package whitespace-cleanup-mode
  :preface
  (defun untabify-except-makefiles ()
    "Replace tabs with spaces except in makefiles."
    (unless (derived-mode-p 'makefile-mode)
      (untabify (point-min) (point-max))))

  :custom
  (tab-width 4)
  (show-trailing-whitespace t)
  (indent-tabs-mode nil)

  :hook
  (before-save . (lambda () (untabify-except-makefiles)))
  (elpaca-after-init . global-whitespace-cleanup-mode)

  :config
  ;; don't show the trailing whitespace in special buffers like the minibuffer
  (dolist (hook '(special-mode-hook
                  term-mode-hook
                  comint-mode-hook
                  compilation-mode-hook
                  minibuffer-setup-hook))
    (add-hook hook (lambda () (setq show-trailing-whitespace nil)))))
