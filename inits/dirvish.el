(use-package dirvish
  :after nerd-icons

  :custom
  (dirvish-mode-line-format
   '(:left (sort file-time "" file-size symlink) :right (omit yank index)))

  (dirvish-attributes '(nerd-icons file-size collapse subtree-state vc-state git-msg))

  :hook
  (elpaca-after-init . dirvish-peek-mode)
  (elpaca-after-init . dirvish-override-dired-mode)

  :general

  (my-leader
    :states 'normal
    "f d" '(dirvish :wk "open dirvish"))

  (general-define-key
   :keymaps 'dirvish-mode-map
   :states 'normal
   :packages '(dired dirvish)
   "h" 'dired-up-directory
   "l" 'dired-find-file
   "q" 'dirvish-quit
   "TAB" 'dirvish-subtree-toggle))
