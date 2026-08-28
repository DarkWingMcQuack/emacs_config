(use-package emacs
  :ensure nil
  :preface
  (defun my/display-line-numbers-mode-maybe ()
    (my/enable-expensive-mode #'display-line-numbers-mode))

  :custom
  (display-line-numbers-type 'absolute)
  :hook
  (prog-mode . my/display-line-numbers-mode-maybe)
  (text-mode . my/display-line-numbers-mode-maybe)
  (conf-mode . my/display-line-numbers-mode-maybe))
