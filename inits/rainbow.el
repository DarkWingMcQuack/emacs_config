(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :preface
  (defun my/rainbow-mode-maybe ()
    (when (my/expensive-mode-safe-p)
      (rainbow-mode 1)))

  :hook
  (prog-mode . my/rainbow-mode-maybe)
  (css-mode . my/rainbow-mode-maybe)
  (html-mode . my/rainbow-mode-maybe))
