(use-package auctex
  :mode ("\\.tex\\'" . latex-mode)
  :defer t
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :hook
  ((LaTeX-mode . LaTeX-preview-setup)
   (LaTeX-mode . turn-on-reftex))

  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-save-query nil)
  (TeX-show-compilation nil)
  (TeX-PDF-mode t)

  :config
  (setq-default TeX-master nil))

(use-package company-auctex
  :config (company-auctex-init))

(use-package reftex
  :commands turn-on-reftex
  :after auctex
  :custom
  (reftex-plug-into-AUCTeX t))


(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :custom
  (bibtex-align-at-equal-sign t))
