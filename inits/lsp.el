(use-package eglot
  :after flymake
  :commands eglot eglot-ensure
  :config
  ;; stay out of my company backends you fuck
  (add-to-list 'eglot-stay-out-of 'company-backends)
  ;; performance
  (fset #'jsonrpc--log-event #'ignore)

  ;; add servers which eglot does not know of
  (add-to-list 'eglot-server-programs
               `(scala-ts-mode . ("metals" "-Dmetals.client=emacs")))

  (add-to-list 'eglot-server-programs `(python-ts-mode . ("pylsp")))
  (add-to-list 'eglot-server-programs `(c++-ts-mode . ("clangd")))

  :custom
  (eglot-events-buffer-config '(:size 0 :format full))
  (eglot-events-buffer-size 0)

  :general

  (general-define-key
   :keymaps 'eglot-mode-map
   :states 'normal
   "c w" '(eglot-code-actions     :wk "code action")
   "g d" '(eglot-find-declaration :wk "find declaration")
   "g R" '(eglot-rename           :wk "rename"))

  (my-leader
    :keymaps 'eglot-mode-map
    :states 'normal
    "TAB" '(eglot-format-buffer  :wk "format buffer")
    "x r" '(xref-find-references :wk "find references")))

(use-package consult-eglot
  :after (eglot consult))

(use-package eglot-booster
  :ensure (eglot-booster
           :host github
           :repo "jdtsmith/eglot-booster")
  :after eglot
  :hook (elpaca-after-init . eglot-booster-mode))
