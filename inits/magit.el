(use-package magit
  :defer t
  :general
  (general-define-key
   :keymaps 'magit-mode-map
   :states 'normal
   "q" (lambda()
         (interactive)
         (magit-mode-bury-buffer t)))

  (my-leader
    "g g" '(magit-status :wk "magit status")
    "g t" '(magit-todos-list :wk "show todos")
    "g p" '(magit-push :wk "push"))

  (general-define-key
   :keymaps 'transient-map
   "q" 'transient-quit-one
   "<escape>" 'transient-quit-one)

  (general-define-key
   :keymaps 'transient-edit-map
   "q" 'transient-quit-one
   "<escape>" 'transient-quit-one)

  (general-define-key
   :keymaps 'transient-sticky-map
   "q" 'transient-quit-seq
   "<escape>" 'transient-quit-seq))

;; disable magit-todos because it errors often:
;;
;; error in process sentinel: magit-todos--async-when-done: Process "magit-todos--scan-with-git-diff" failed with exit code 125.  Output:"/usr/bin/nice: a command must be given with an adjustment
;; Try '/usr/bin/nice --help' for more information.

(use-package magit-todos
  :after magit
  :hook (magit-mode . magit-todos-mode))
