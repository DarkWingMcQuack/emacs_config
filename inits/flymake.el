(use-package flymake
  :hook
  (prog-mode . flymake-mode)
  (LaTeX-mode . flymake-mode)
  (text-mode . flymake-mode))
