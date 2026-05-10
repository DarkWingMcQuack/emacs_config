(use-package emacs
  :ensure nil
  :preface
  (defun my/display-line-numbers-mode-maybe ()
    (when (my/expensive-mode-safe-p)
      (display-line-numbers-mode 1)))

  :custom
  (display-line-numbers-type 'absolute)
  (display-line-numbers-width-start t)
  :hook
  (prog-mode . my/display-line-numbers-mode-maybe)
  (text-mode . my/display-line-numbers-mode-maybe)
  (conf-mode . my/display-line-numbers-mode-maybe))
