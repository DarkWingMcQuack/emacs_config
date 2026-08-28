(use-package centered-cursor-mode
  :preface
  (defun my/centered-cursor-mode-maybe ()
    (my/enable-expensive-mode #'centered-cursor-mode))

  :hook
  (prog-mode . my/centered-cursor-mode-maybe)
  (text-mode . my/centered-cursor-mode-maybe))
