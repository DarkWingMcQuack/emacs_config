(use-package doom-themes
  :defer t

  :preface
  (defun my/doom-theme-setup ()
    (load-theme 'doom-tomorrow-night t))

  :hook (after-init . my/doom-theme-setup))

;; other good themes: doom-spacegray, doom-tomorrow-night
