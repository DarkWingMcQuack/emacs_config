(use-package flycheck
  :preface
  (defun my/flycheck-mode-maybe ()
    (my/enable-expensive-mode #'flycheck-mode))

  :hook
  (prog-mode . my/flycheck-mode-maybe)
  (LaTeX-mode . my/flycheck-mode-maybe))
