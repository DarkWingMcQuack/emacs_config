(use-package org
  :ensure nil
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
  :after org
  :hook (org-mode . org-fragtog-mode))

(use-package org-modern
  :after org
  :hook
  (org-agenda-finalize . (lambda () (org-modern-agenda)))
  (org-mode . (lambda () (org-modern-mode))))


(use-package org-modern-indent
  :ensure(org-modern-indent
          :host github
          :repo "jdtsmith/org-modern-indent")

  :after (org org-modern)
  :hook (org-mode . org-modern-indent-mode))
