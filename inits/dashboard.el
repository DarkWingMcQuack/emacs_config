(use-package dashboard
  :after nerd-icons
  :preface
  (defun my/lazy-dashboard () (dashboard-open))

  :hook (elpaca-after-init . my/lazy-dashboard)

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

  (dashboard-footer-messages
  '("Free as free speech, free as free Beer")))
