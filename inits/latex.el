(use-package auctex
  :preface
  (defun my/latex-lsp-deferred ()
    (require 'lsp-latex)
    (my/lsp-deferred))

  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook
  (LaTeX-mode . prettify-symbols-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . TeX-fold-mode)
  (LaTeX-mode . my/latex-lsp-deferred)


  :custom
  (TeX-electric-sub-and-superscript t)
  (TeX-electric-math (cons "$" "$"))
  (LaTeX-item-indent 2)
  (reftex-plug-into-AUCTeX t))

(use-package lsp-latex
  :after lsp-mode)
