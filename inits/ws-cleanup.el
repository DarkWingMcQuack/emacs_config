(defun my/whitespace-cleanup-mode-maybe ()
  "Enable whitespace cleanup for safe, file-backed buffers."
  (when (and buffer-file-name
             (require 'whitespace-cleanup-mode nil t)
             (not whitespace-cleanup-mode)
             (not (local-variable-p 'whitespace-cleanup-mode))
             (my/expensive-mode-safe-p))
    (whitespace-cleanup-mode 1)))

(use-package whitespace-cleanup-mode
  :custom
  (tab-width 4)
  (show-trailing-whitespace t)
  (indent-tabs-mode nil)

  :hook
  (find-file . my/whitespace-cleanup-mode-maybe)

  :config
  ;; don't show the trailing whitespace in special buffers like the minibuffer
  (dolist (hook '(special-mode-hook
                  term-mode-hook
                  comint-mode-hook
                  compilation-mode-hook
                  minibuffer-setup-hook))
    (add-hook hook (lambda () (setq show-trailing-whitespace nil)))))
