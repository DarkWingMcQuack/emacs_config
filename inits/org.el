(use-package org
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  :custom
  (org-directory "~/Nextcloud/notes/")
  (org-log-done t)
  (org-startup-indented t)
  (org-startup-truncated nil)
  (org-startup-with-inline-images t)
  (org-todo-keywords
   '((sequence "TODO(t)" "MAYBE(m)" "NOTIZ(n)" "|" "DONE(x)" "CANCELLED(c)")))
  (org-todo-keyword-faces
   '(("TODO"  . (:foreground "#b70101" :weight bold))
     ("NOTIZ"  . (:foreground "sienna" :weight bold))
     ("MAYBE"  . (:foreground "darkorange" :weight bold))
     ("DONE"  . (:foreground "forestgreen" :weight bold))
     ("CANCELLED"  . shadow)))


  (org-ellipsis "  ") ;; folding symbol
  (org-pretty-entities t)
  (org-hide-emphasis-markers t) ;; show actually italicized text instead of /italicized text/
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t)
  :general
  (general-define-key
   :keymaps 'org-mode-map
   :states 'normal
   "K" '(org-shiftup :wk "org next priority")
   "TAB" '(org-cycle :wk "org next priority")
   "J" '(org-shiftdown :wk "org previous priority")
   "L" '(org-shiftright :wk "org next status")
   "H" '(org-shiftright :wk "org previous status"))

  (my-leader 'org-mode-map
	"m t" '(org-todo :wk "cycle task status")
	"c c" '(org-toggle-checkbox :wk "toggle checkbox")
	"m d s" '(org-schedule :wk "org-schedule")
	))

(use-package org-bullets
  :hook
  (org-mode . (lambda () (org-bullets-mode 1))))

(use-package org-agenda
  :straight (:type built-in)
  :custom
  (org-agenda-files (directory-files-recursively
					 "~/Nextcloud/"
					 "\.org$"))

  ;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  
  :general
  (my-leader
	"o a" '(org-agenda :wk "agenda")))


(use-package evil-org
  :after (org evil)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . (lambda ()
					 (evil-org-set-key-theme)))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
