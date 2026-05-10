(use-package flycheck
  :preface
  (defun my/flycheck-mode-maybe ()
    (when (my/expensive-mode-safe-p)
      (flycheck-mode 1)))

  :hook
  (prog-mode . my/flycheck-mode-maybe)
  (LaTeX-mode . my/flycheck-mode-maybe))
