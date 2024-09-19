(use-package org
  :defer t
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  :custom
  (org-latex-create-formula-image-program 'dvipng)
  (org-log-done t)
  (org-startup-indented t)
  (org-startup-truncated nil)
  (org-startup-with-inline-images t)

  (org-ellipsis "  ") ;; folding symbol
  (org-pretty-entities nil)
  (org-hide-emphasis-markers t) ;; show actually italicized text instead of /italicized text/
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t)
  ;; (plist-put org-format-latex-options :scale 1.5)
  )

;; (eval-after-load "org" '(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5)))


(use-package org-bullets
  :defer t
  :hook
  (org-mode . (lambda () (org-bullets-mode 1))))

(use-package org-fragtog
  :defer t
  :hook (org-mode . org-fragtog-mode))


(use-package evil-org
  :defer t
  :after (org evil)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . (lambda ()
                     (evil-org-set-key-theme))))
