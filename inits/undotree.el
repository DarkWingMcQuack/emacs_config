(use-package undo-tree
  :defer t
  :preface
  (defun my/lazy-ut () (global-undo-tree-mode))

  :hook
  (after-init . my/lazy-ut)

  :custom
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  (undo-tree-visualizer-timestamps t)
  (undo-tree-auto-save-history t)

  :general
  (my-leader
    "u" '(undo-tree-visualize :wk "open undotree"))

  (general-define-key
   :states 'normal

   "u" '(undo-tree-undo :wk "undo")
   "U" '(undo-tree-redo :wk "redo")))
