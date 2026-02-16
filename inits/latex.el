(use-package auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook
  (LaTeX-mode . prettify-symbols-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . TeX-fold-mode)


  :custom
  (TeX-electric-sub-and-superscript t)
  (TeX-electric-math (cons "$" "$"))
  (LaTeX-item-indent 2)
  (reftex-plug-into-AUCTeX t))
