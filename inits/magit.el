(use-package transient)

(use-package magit
  :preface
  (defun my/magit-bury-buffer () (magit-mode-bury-buffer t))

  :general
  (general-define-key
   :keymaps 'magit-mode-map
   :states 'normal
   "q" 'my/magit-burry-buffer)

  (my-leader
    "g g" '(magit-status :wk "magit status")
    "g p" '(magit-push :wk "push"))

  (general-define-key
   :keymaps '(transient-map transient-edit-map)
   "q" 'transient-quit-one
   "<escape>" 'transient-quit-one)

  (general-define-key
   :keymaps 'transient-sticky-map
   "q" 'transient-quit-seq
   "<escape>" 'transient-quit-seq))

(use-package magit-todos
  :after magit
  :defer t
  :hook (magit-mode . magit-todos-mode)
  :general
  (my-leader
    "g t" '(magit-todos-list :wk "show todos")))
