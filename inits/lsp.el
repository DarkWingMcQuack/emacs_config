(use-package lsp-mode
  :custom
  ;; performance
  (lsp-idle-delay 0.500)
  (lsp-log-io nil)
  (lsp-print-io nil)
  (lsp-trace nil)
  (lsp-print-performance nil)
  (lsp-completion-provider :capf)

  (company-lsp-cache-candidates t) ;; auto, t(always using a cache), or nil
  (company-lsp-async t)
  (company-lsp-enable-snippet t)
  (company-lsp-enable-recompletion t)

  (lsp-auto-guess-root t)
  (lsp-enable-snippet t)
  (lsp-enable-completion-at-point t)
  (lsp-enable-xref t)
  (lsp-enable-indentation t)
  (lsp-signature-auto-activate t)
  (lsp-signature-render-documentation t)
  (lsp-enable-text-document-color t)

  (lsp-semantic-tokens-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-segments '(count icon name))

  (lsp-signature-function 'lsp-signature-posframe)


  (lsp-clients-clangd-args
   '("-j=4"
	 "--background-index"
	 "-log=error"
	 "--completion-style=detailed"
	 "--header-insertion=never"
	 "--clang-tidy"))
  :hook
  (go-mode . lsp)
  (python-mode . lsp)
  (c++-mode . lsp)
  (c-mode . lsp)
  (rust-mode . lsp)
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  (lsp-mode . lsp-signature-mode)
  ;; only format-on-save if lsp-mode is active
  ;; (lsp-mode . (lambda ()
  ;; 				(add-hook 'before-save-hook 'lsp-format-buffer nil 'make-it-local)))


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
  :custom

  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point

  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)

  (lsp-ui-sideline-enable nil)
  (lsp-ui-peek-enable nil)

  :hook (lsp-mode . lsp-ui-mode))

;; Add metals backend for lsp-mode
;; for scala
(use-package lsp-metals)

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))
