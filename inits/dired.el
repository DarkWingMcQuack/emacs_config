(use-package dired
  :straight (:type built-in)
  :custom
  (dired-recursive-deletes 'always)
  (dired-recursive-copies  'always)

  :general
  (my-leader 'dired-mode-map
    "+" '(dired-create-directory :wk "new directory"))

  (general-define-key
   :keymaps 'dired-mode-map
   :states '(normal motion)
   "RET" '(dired-find-alternate-file :wk "open file")
   "f" '(dired-find-alternate-file :wk "open file")
   "+" '(dired-create-empty-file :wk "create new file")
   "d" '(dired-flag-file-deletion :wk "mark delete")
   "U" '(dired-up-directory :wk "goto parent dir")
   "m" '(dired-mark :wk "mark")
   "u" '(dired-unmark :wk "unmark/undelete")
   "x" '(dired-do-flagged-delete :wk "delete")))

(use-package all-the-icons-dired
  :hook
  (dired-mode . all-the-icons-dired-mode))
