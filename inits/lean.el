(use-package lean4-mode
  :preface
  (defun my/lean4-scratch-buffer ()
    "Create a temp Lean 4 file in $TMP, open it, and enable LSP."
    (interactive)
    (let* ((file (make-temp-file "lean4-scratch-" nil ".lean"))
           (buf (find-file file)))
      (with-current-buffer buf
        (lean4-mode)
        (eglot-ensure)
        (message "Lean4 scratch buffer ready: %s" file))))

  :ensure (lean4-mode
           :host github
           :repo "leanprover-community/lean4-mode"
           :files ("*.el" "data"))

  :mode "\\.lean4?\\'"

  :hook (lean4-mode . eglot-ensure)
  :general
  (my-leader
    :keymaps 'lean4-mode-map
    :states 'normal
    "i"   '(lean4-toggle-info               :wk "toggle lean4 info view")
    "b r" '(lean4-refresh-file-dependencies :wk "refresh file")
    "b x" '(lean4-std-exe                   :wk "run lean4 file")))
