(use-package eglot
  :defer t
  :hook
  (go-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (scala-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode)
                 "basedpyright-langserver" "--stdio"))

  :general
  (general-define-key
   :keymaps 'eglot-mode-map
   :states 'normal
   "c w" 'eglot-code-actions
   "g d" 'eglot-find-declaration
   "g R" 'eglot-rename)

  (my-leader
    :states 'normal
    "TAB" 'eglot-format-buffer
    "s d" 'eglot-documentation
    "x r" 'xref-find-references
    "d"   'eglot-documents))

(use-package consult-eglot
  :defer t
  :after (eglot consult))

(use-package eldoc
  :defer t
  :hook (prog-mode . eldoc-mode))
