(setq custom-tab-width 4)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))

;; Hooks to Disable Tabs
(add-hook 'prog-mode-hook 'disable-tabs)
(add-hook 'text-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode))
