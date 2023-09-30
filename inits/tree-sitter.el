(use-package tree-sitter
  :config
  (global-tree-sitter-mode t)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package  tree-sitter-langs)
(use-package tree-sitter-indent)


(use-package ts-fold
  :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold")
  :config
  (global-ts-fold-mode)
  :general
  (general-define-key
   :states 'motion
   "z a" 'ts-fold-toggle))
