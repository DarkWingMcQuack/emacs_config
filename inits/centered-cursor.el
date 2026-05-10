(use-package centered-cursor-mode
  :preface
  (defun my/centered-cursor-mode-maybe ()
    (when (my/expensive-mode-safe-p)
      (centered-cursor-mode 1)))

  :hook
  (prog-mode . my/centered-cursor-mode-maybe)
  (text-mode . my/centered-cursor-mode-maybe))
