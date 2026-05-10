(defcustom my/harper-ls-command "harper-ls"
  "Command used to start the Harper language server."
  :type 'string)

(defcustom my/harper-ls-modes
  '(text-mode
    markdown-mode
    gfm-mode
    org-mode
    latex-mode
    LaTeX-mode
    plain-tex-mode
    TeX-mode
    git-commit-mode)
  "Major modes where Harper should run."
  :type '(repeat symbol))

(defun my/harper-ls-available-p ()
  "Return non-nil when Harper's language server is available."
  (executable-find my/harper-ls-command))

(defun my/harper-ls-warn-if-unavailable ()
  "Warn when Harper is configured but unavailable."
  (unless (my/harper-ls-available-p)
    (display-warning
     'spell
     (format "Harper disabled. Missing executable: %s" my/harper-ls-command)
     :warning)))

(defun my/harper-ls-maybe ()
  "Start Harper when `harper-ls' is available."
  (when (my/harper-ls-available-p)
    (my/lsp-deferred)))

(add-hook 'emacs-startup-hook #'my/harper-ls-warn-if-unavailable)

(dolist (mode my/harper-ls-modes)
  (add-hook (intern (format "%s-hook" mode)) #'my/harper-ls-maybe))

(my-leader
  "l" '(:ignore t :wk "language/writing"))

(with-eval-after-load 'lsp-mode
  (dolist (language-id '((text-mode . "plaintext")
                         (org-mode . "plaintext")
                         (git-commit-mode . "gitcommit")
                         (markdown-mode . "markdown")
                         (gfm-mode . "markdown")
                         (latex-mode . "latex")
                         (LaTeX-mode . "latex")
                         (plain-tex-mode . "plaintex")
                         (TeX-mode . "tex")))
    (add-to-list 'lsp-language-id-configuration language-id))

  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda ()
                       (list (or (executable-find my/harper-ls-command)
                                 my/harper-ls-command)
                             "--stdio")))
    :major-modes my/harper-ls-modes
    :priority -1
    :add-on? t
    :multi-root t
    :server-id 'harper-ls)))
