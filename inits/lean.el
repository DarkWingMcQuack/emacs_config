(use-package lean4-mode
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
    "l b" '(lean4-lake-build                :wk "run lake build")
    "l x" '(lean4-std-exe                   :wk "run lean4 file"))

  :config
  ;; Supplement Lean's server only when available in the buffer's direnv PATH.
  (with-eval-after-load 'lsp-mode
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-stdio-connection '("lean-fmt" "lsp"))
      :activation-fn (lambda (&rest _)
                       (and (derived-mode-p 'lean4-mode)
                            (executable-find "lean-fmt")))
      :server-id 'lean-fmt
      :add-on? t)))

  (defun my/suppress-lsp-inlayhint-warnings (orig-fun type message &rest args)
    "Suppress LSP workspace/inlayHint/refresh warnings."
    (unless (and (eq type 'lsp-mode)
                 (stringp message)
                 (string-match-p "workspace/inlayHint/refresh" message))
      (apply orig-fun type message args)))

  (advice-add 'display-warning :around
              #'my/suppress-lsp-inlayhint-warnings))

(with-eval-after-load 'lean4-mode
  ;; Start LSP after direnv has populated the buffer's environment.
  (remove-hook 'lean4-mode-hook #'lsp)
  (add-hook 'lean4-mode-hook #'my/lsp-deferred))
