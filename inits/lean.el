(use-package lean4-mode
  :after lsp-mode

  :ensure (lean4-mode
           :host github
           :repo "leanprover-community/lean4-mode"
           :files ("*.el" "data"))

  :mode "\\.lean4?\\'"
  :general
  (my-leader
    :keymaps 'lean4-mode-map
    :states 'normal
    "i"   '(lean4-toggle-info               :wk "toggle lean4 info view")
    "b r" '(lean4-refresh-file-dependencies :wk "refresh file")
    "b x" '(lean4-std-exe                   :wk "run lean4 file")))
