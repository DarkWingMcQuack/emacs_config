(use-package lsp-mode
  :custom
  ;; performance
  (lsp-idle-delay 0.100)
  (lsp-completion-provider :none)
  (lsp-log-io nil)

  (lsp-lens-enable t)
  (company-lsp-enable-snippet t)
  (lsp-auto-guess-root t)
  (lsp-enable-snippet t)
  (lsp-enable-completion-at-point t)
  (lsp-enable-xref t)
  (lsp-signature-auto-activate t)
  (lsp-signature-render-documentation t)
  (lsp-enable-text-document-color t)
  (lsp-enable-indentation t)
  (lsp-enable-folding nil)
  (lsp-semantic-tokens-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-segments '(count icon name))
  (lsp-signature-function 'lsp-signature-posframe)

  ;; pylsp configuration
  (lsp-pylsp-plugins-ruff-enabled t)
  (lsp-pylsp-plugins-black-enabled t)
  (lsp-pylsp-plugins-rope_autoimport-enabled t)
  (lsp-pylsp-plugins-flake8-enabled nil)


  :hook
  (go-mode . lsp)
  (rust-mode . lsp)
  (python-mode . lsp)
  (c++-mode . lsp)
  (c-mode . lsp)
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  (lsp-mode . lsp-signature-mode)


  :general
  (my-leader 'lsp-mode-map
    :states 'normal
    "TAB" '(lsp-format-buffer :wk "format buffer")
    "s d" '(lsp-describe-thing-at-point :wk "show documentation")
    "x r" '(xref-find-references :wk "xref find references")
    "x a" '(xref-find-apropos :wk "xref find apropos")
    "d"   '(lsp-ui-doc-glance :wk "peek documentation"))

  (general-define-key
   :keymaps 'lsp-mode-map
   :states 'normal
   "c w" '(lsp-execute-code-action :wk "code action")
   "g d" '(lsp-find-definition :wk "goto definition")))


(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-delay 2)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-sideline-show-code-actions t)

  ;; lsp-ui-flycheck
  ;; (lsp-ui-flycheck-enable t)

  (lsp-ui-sideline-enable nil)
  (lsp-ui-peek-enable nil))

(use-package lsp-metals)

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))


;; (use-package eglot
;;   :hook ((go-mode . eglot-ensure)
;;          (rust-mode . eglot-ensure)
;;          (python-mode . eglot-ensure)
;;          (c++-mode . eglot-ensure)
;;          (c-mode . eglot-ensure)
;;          (scala-mode . eglot-ensure))

;;   :config

;;   (add-hook 'eglot-managed-mode-hook
;;             (lambda ()
;;               ;; Show flymake diagnostics first.
;;               (setq eldoc-documentation-functions
;;                     (cons #'flymake-eldoc-function
;;                           (remove #'flymake-eldoc-function eldoc-documentation-functions)))
;;               (eglot-inlay-hints-mode -1)
;;               ;; Show all eldoc feedback.
;;               (setq eldoc-documentation-strategy #'eldoc-documentation-compose)))




;;   :general

;;   (general-define-key
;;    :keymaps 'eglot-mode-map
;;    :states 'normal
;;    "c w" '(eglot-code-actions :wk "code action")
;;    "g a" '(xref-find-apropos :wk "xref find apropos")
;;    "g r" '(xref-find-references :wk "xref find references")
;;    "g R" '(eglot-rename :wk "rename symbol")
;;    "g d" '(xref-find-definitions :wk "goto definition"))

;;   (my-leader 'eglot-mode-map
;;     :states 'normal
;;     "TAB" '(eglot-format-buffer :wk "format buffer")
;;     "d" '(eldoc-box-help-at-point :wk "peek documentation")
;;     "s d" '(eldoc :wk "show documentation")))

;; (use-package eldoc-box
;;   :hook (eglot-managed-mode-hook #'eldoc-box-hover-mode t)
;;   )
