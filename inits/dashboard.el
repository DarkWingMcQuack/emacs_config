(setq dashboard-startup-banner "~/.emacs.d/gnu.svg")

(defun my/lazy-dashboard ()
  (require 'dashboard)
  (setq dashboard-startup-banner "~/.emacs.d/gnu.svg")
  (with-current-buffer (get-buffer-create dashboard-buffer-name)
    (setq default-directory user-emacs-directory))
  (dashboard-open))

(add-hook 'elpaca-after-init-hook #'my/lazy-dashboard)

(use-package dashboard
  :custom
  (dashboard-startup-banner "~/.emacs.d/gnu.svg")
  (dashboard-image-banner-max-height 300)
  (dashboard-items '((recents  . 5)
                     (projects . 5)
                     (bookmarks . 5)))
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)

  (dashboard-footer-messages '("Free as free speech, free as free Beer")))
