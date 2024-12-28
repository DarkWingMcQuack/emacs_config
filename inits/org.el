(use-package org
  :defer t
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  :hook (org-mode . org-num-mode)
  :custom
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis "  ") ;; folding symbol
  (org-pretty-entities t)
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t))

(use-package org-fragtog
  :defer t
  :hook (org-mode . org-fragtog-mode))



(use-package evil-org
  :defer t
  :after (org evil)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . (lambda () (evil-org-set-key-theme))))

(use-package org-modern
  :defer t
  :after org
  :hook
  (org-agenda-finalize . (lambda () (org-modern-agenda)))
  (org-mode . (lambda () (org-modern-mode))))


(use-package org-modern-indent
  :defer t
  :after (org org-modern)
  :vc (org-modern-indent :url "http://github.com/jdtsmith/org-modern-indent")
  :hook (org-mode . org-modern-indent-mode))
