;; unfortunatly lean4-mode currently can only be used with lsp-mode instead of eglot
;; there is a current refactor to fix this, but for now we need lsp mode :(

(use-package lsp-mode
  :custom
  (lsp-inlay-hint-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  :general
  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "g d"  '(lsp-find-definition       :wk "goto definition")
    "g r"  '(lsp-find-references       :wk "find references")
    "g D"  '(lsp-find-declaration      :wk "find declaration")
    "g R"  '(lsp-rename                :wk "rename")
    "c w"  '(lsp-execute-code-action   :wk "code action")
    "TAB"  '(lsp-format-buffer         :wk "format buffer")))

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
