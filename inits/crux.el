(use-package crux
  :general
  (my-leader
    :keymaps 'override
    "w s" '(crux-transpose-windows :wk "switch windows")
    "b b" '(crux-switch-to-previous-buffer :wk "switch to last buffer")
    "f r" '(crux-rename-file-and-buffer :wk "rename file")))

