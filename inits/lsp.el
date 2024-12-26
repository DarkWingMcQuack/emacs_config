(use-package eglot
  :defer t
  :after (cape corfu yasnippet yasnippet-capf)

  :preface
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'eglot-completion-at-point
                       :with 'yasnippet-capf))))

  :hook
  (eglot-managed-mode . my/eglot-capf)
  (go-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (scala-mode . eglot-ensure)

  :init
  ;; cache-busting
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)

  ;; performance
  (fset #'jsonrpc--log-event #'ignore)
  (setq eglot-events-buffer-config '(:size 0 :format full))
  (setq eglot-events-buffer-size 0)

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
    "x r" 'xref-find-references))

(use-package consult-eglot
  :defer t
  :after (eglot consult))

(use-package eglot-booster
  :ensure t
  :straight (:type git :host github :repo "jdtsmith/eglot-booster")
  :after eglot
  :config
  (eglot-booster-mode))

(use-package eldoc
  :defer t
  :hook (prog-mode . eldoc-mode))


(use-package eldoc-box
  :after (eglot eldoc)
  :defer t
  :general
  (my-leader
    :states 'normal
    "d" 'eldoc-box-help-at-point))
