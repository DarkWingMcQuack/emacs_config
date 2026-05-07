(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)
  (LaTeX-mode . flycheck-mode)
  (text-mode . flycheck-mode))
