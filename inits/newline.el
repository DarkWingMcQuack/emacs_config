(use-package emacs
  :ensure nil
  :general
  (general-define-key
   :keymaps 'prog-mode-map
   :states 'insert
   "RET"   '(electric-newline-and-maybe-indent :wk "newline and indent")))
