(use-package whitespace-cleanup-mode
  :defer 1
  :preface
  (defun untabify-except-makefiles ()
    "Replace tabs with spaces except in makefiles."
    (unless (derived-mode-p 'makefile-mode)
      (untabify (point-min) (point-max))))
  :custom
  (tab-width 4)
  ;; show trailing whitespace
  (show-trailing-whitespace t)

  :config
  (add-hook 'before-save-hook (lambda () (untabify-except-makefiles)))
  ;; enable ws-cleanup-mode globally
  (global-whitespace-cleanup-mode)
  ;; don't use tabs to indent
  (setq-default indent-tabs-mode nil)

  ;; don't show the trailing whitespace in special buffers like the minibuffer
  (dolist (hook '(special-mode-hook
                  term-mode-hook
                  comint-mode-hook
                  compilation-mode-hook
                  minibuffer-setup-hook))
    (add-hook hook (lambda () (setq show-trailing-whitespace nil)))))
