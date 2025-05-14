(use-package doom-themes
  :preface
  (defun my/doom-theme-setup ()
    (load-theme 'doom-spacegrey t))

  :hook (elpaca-after-init . my/doom-theme-setup))
