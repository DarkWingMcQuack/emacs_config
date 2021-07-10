(use-package lsp-mode
  :custom
  (lsp-completion-provider :capf)
  (company-lsp-cache-candidates t) ;; auto, t(always using a cache), or nil
  (company-lsp-async t)
  (company-lsp-enable-snippet t)
  (company-lsp-enable-recompletion t)
  (lsp-enable-snippet t)
  (lsp-print-io nil)
  (lsp-enable-completion-at-point t)
  (lsp-enable-xref t)
  (lsp-enable-indentation t)
  (lsp-semantic-tokens-enable nil)
  (lsp-signature-auto-activate t)
  (lsp-signature-render-documentation t)
  (lsp-enable-text-document-color t)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-trace nil)
  (lsp-print-performance nil)
  (lsp-auto-guess-root t)
  (lsp-modeline-code-actions-segments '(count icon name))
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
  ;; only format-on-save if lsp-mode is active
  (lsp-mode . (lambda ()
				(add-hook 'before-save-hook 'lsp-format-buffer nil 'make-it-local)))

  

  :general
  (my-leader 'lsp-mode-map
	:states 'normal
	"TAB" '(lsp-format-buffer :wk "format buffer")
	"s d" '(lsp-ui-doc-glance :wk "show documentation"))

  (general-define-key
   :keymaps 'lsp-mode-map
   :states 'normal
   "c w" '(lsp-execute-code-action :wk "code action")
   "g d" '(lsp-find-definition :wk "goto definition")))


(use-package lsp-ui
  :after lsp-mode
  :custom

  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 120)
  (lsp-ui-doc-max-height 30)
  ;; (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  (lsp-ui-doc-focus-frame t)

  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)

  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always

  :hook (lsp-mode . lsp-ui-mode))

;; Add metals backend for lsp-mode
;; for scala
(use-package lsp-metals)

(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)

  :config
  (require 'dap-gdb-lldb)   ; download and expand lldb-vscode to the =~/.extensions/webfreak.debug=
  (require 'dap-go)     ; download and expand vscode-go-extenstion to the =~/.extensions/go=
  (require 'dap-python)
  (use-package dap-ui
	:ensure nil
	:config
	(dap-ui-mode 1)))
