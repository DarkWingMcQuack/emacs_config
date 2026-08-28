(use-package rainbow-delimiters
  :preface
  (defun my/rainbow-delimiters-mode-maybe ()
    (my/enable-expensive-mode #'rainbow-delimiters-mode))
  :hook
  (prog-mode . my/rainbow-delimiters-mode-maybe))

(use-package rainbow-mode
  :preface
  (defun my/rainbow-mode-maybe ()
    (my/enable-expensive-mode #'rainbow-mode))

  :hook
  (css-mode . my/rainbow-mode-maybe)
  (html-mode . my/rainbow-mode-maybe))
