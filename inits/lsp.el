(use-package lsp-mode
  :commands (lsp lsp-deferred)

  :init
  (setq read-process-output-max (* 1024 1024))

  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-completion-provider :capf)
  (lsp-diagnostics-provider :flycheck)
  (lsp-enable-on-type-formatting nil)
  (lsp-idle-delay 0.5)
  (lsp-log-io nil)

  (lsp-headerline-breadcrumb-enable nil)
  (lsp-use-plists t)

  :general
  (general-define-key
   :keymaps 'lsp-mode-map
   :states 'normal
   "c w" '(lsp-execute-code-action :wk "code action")
   "g d" '(lsp-find-definition :wk "find declaration")
   "g R" '(lsp-rename              :wk "rename"))

  (general-define-key
   :states 'normal
   "g f" '(xref-go-forward :wk "xref go forward")
   "g b" '(xref-go-back :wk "xref go back"))

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "TAB" '(lsp-format-buffer      :wk "format buffer")
    "x r" '(xref-find-references   :wk "find references")))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-use-childframe t)


  ;; Inline diagnostics near point
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions t)
  :general

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "d" '(lsp-ui-doc-glance :wk "show doku")))


(use-package consult-lsp
  :after (consult lsp-mode)
  :general

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "p s" '(consult-lsp-symbols   :wk "find project symbols")
    "s e" '(consult-lsp-file-diagnostics :wk "show file diagnostics")))
