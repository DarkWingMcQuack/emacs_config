(use-package eglot
  :after (cape corfu yasnippet-capf flymake)
  :defer t

  :preface
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'eglot-completion-at-point
                       'cape-file
                       'yasnippet-capf))))

  :hook
  (eglot-managed-mode . my/eglot-capf)

  :init
  ;; performance
  (fset #'jsonrpc--log-event #'ignore)
  (setq eglot-events-buffer-config '(:size 0 :format full))
  (setq eglot-events-buffer-size 0)

  :general
  (general-define-key
   :keymaps 'eglot-mode-map
   :states 'normal
   "c w" '(eglot-code-actions :wk "code action")
   "g d" '(eglot-find-declaration :wk "find declaration")
   "g R" '(eglot-rename :wk "rename"))

  (my-leader
    :keymaps 'eglot-mode-map
    :states 'normal
    "TAB" '(eglot-format-buffer :wk "format buffer")
    "x r" '(xref-find-references :wk "find references")))

(use-package consult-eglot
  :after (eglot consult))

;; (use-package eglot-booster
;;   :ensure (eglot-booster
;;            :host github
;;            :repo "jdtsmith/eglot-booster")
;;   :after eglot
;;   :hook (elpaca-after-init . eglot-booster-mode))
