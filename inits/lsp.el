(use-package lsp-mode
  :commands (lsp lsp-deferred)

  :custom
  (lsp-completion-provider :capf)
  (lsp-diagnostics-provider :flymake)
  (lsp-flymake-live-reporting t)

  (lsp-headerline-breadcrumb-enable nil)
  (lsp-use-plists t)

  :general
  (general-define-key
   :keymaps 'lsp-mode-map
   :states 'normal
   "c w" '(lsp-execute-code-action :wk "code action")
   "g d" '(lsp-find-declaration    :wk "find declaration")
   "g R" '(lsp-rename              :wk "rename"))

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "TAB" '(lsp-format-buffer      :wk "format buffer")
    "x r" '(xref-find-references   :wk "find references")))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable nil))

(use-package consult-lsp
  :after (consult lsp-mode))

(use-package lsp-metals
  :after lsp-mode
  :custom
  (lsp-metals-server-args '("-Dmetals.client=emacs" "-Dmetals.http=on"))
  :hook
  (scala-mode . lsp-deferred)
  (scala-ts-mode . lsp-deferred))

(use-package lsp-latex
  :after lsp-mode
  :hook (LaTeX-mode . lsp-deferred))
