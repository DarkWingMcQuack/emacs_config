(use-package jinx
  :preface
  (defun my/jinx-correct-or-code-action ()
    "Correct spelling at point, falling back to LSP code actions."
    (interactive)
    (condition-case nil
        (if (bound-and-true-p jinx-mode)
            (jinx-correct)
          (user-error "Jinx is not active"))
      (user-error
       (if (and (bound-and-true-p lsp-mode)
                (fboundp 'lsp-execute-code-action))
           (lsp-execute-code-action)
         (call-interactively #'jinx-correct)))))

  :custom
  (jinx-languages "en_US de_DE")

  :hook
  (text-mode . jinx-mode)
  (prog-mode . jinx-mode)

  :general
  (my-leader
    "l" '(:ignore t :wk "language/writing")
    "l s" '(jinx-languages :wk "spell languages"))

  (general-define-key
   :states 'normal
   "c w" '(my/jinx-correct-or-code-action :wk "correct word/code action")))
