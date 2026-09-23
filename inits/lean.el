(defun my/nael-execute-file ()
  "Compile the current Lean file in its Lake project, when available."
  (interactive)
  (let* ((file (or (buffer-file-name)
                   (user-error "Buffer is not visiting a Lean file")))
         (directory (file-name-directory file))
         (lake-root (or (locate-dominating-file directory "lakefile.lean")
                        (locate-dominating-file directory "lakefile.toml")))
         (default-directory (or lake-root directory))
         (source (if lake-root (file-relative-name file lake-root) file)))
    (compile (format "%s %s"
                     (if lake-root "lake env lean" "lean")
                     (shell-quote-argument source)))))

(defun my/nael-toggle-state-buffer ()
  "Toggle the ElDoc state buffer."
  (interactive)
  (require 'eldoc)
  (let ((window (get-buffer-window eldoc--doc-buffer t)))
    (if window
        (quit-window nil window)
      (eldoc-doc-buffer))))

(use-package nael
  :ensure (nael
           :host codeberg
           :repo "mekeor/nael"
           :branch "release"
           :main "nael/nael.el"
           :files ("nael/*.el"))

  :mode ("\\.lean4?\\'" . nael-mode)
  :hook (nael-mode . my/lsp-deferred)

  :config
  (with-eval-after-load 'lsp-mode
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-stdio-connection '("lean-fmt" "lsp"))
      :activation-fn (lambda (&rest _)
                       (and (derived-mode-p 'nael-mode)
                            (executable-find "lean-fmt")))
      :server-id 'lean-fmt
      :add-on? t)))

  (defun my/suppress-lsp-inlayhint-warnings (orig-fun type message &rest args)
    "Suppress LSP workspace/inlayHint/refresh warnings."
    (unless (and (eq type 'lsp-mode)
                 (stringp message)
                 (string-match-p "workspace/inlayHint/refresh" message))
      (apply orig-fun type message args)))

  (advice-add 'display-warning :around
              #'my/suppress-lsp-inlayhint-warnings))

(use-package nael-lsp
  :ensure (nael-lsp
           :host codeberg
           :repo "mekeor/nael"
           :branch "release"
           :main "nael-lsp/nael-lsp.el"
           :files ("nael-lsp/*.el")
           :autoloads nil)
  :after (nael lsp-mode))

(use-package eldoc-box
  :ensure t
  :custom
  (eldoc-box-only-multi-line t)
  (eldoc-box-max-pixel-width 760)
  (eldoc-box-max-pixel-height 500)

  :general
  (my-leader
    :keymaps 'override
    :states 'normal
    "i" '(eldoc-box-help-at-point :predicate (derived-mode-p 'nael-mode)
                                  :wk "Lean info at point"
                                  :major-modes nael-mode))

  :config
  (let ((color (face-attribute 'mode-line-inactive :background nil t)))
    (when (stringp color)
      (set-face-attribute 'eldoc-box-border nil :background color))))

(my-leader
  :keymaps 'override
  :states 'normal
  "b i" '(my/nael-toggle-state-buffer :predicate (derived-mode-p 'nael-mode)
                                       :wk "toggle Lean state buffer"
                                       :major-modes nael-mode)
  "b c" '(project-compile :predicate (derived-mode-p 'nael-mode)
                          :wk "build Lean project"
                          :major-modes nael-mode)
  "b x" `(:def ,(general-predicate-dispatch
                  'eval-buffer
                  (derived-mode-p 'nael-mode) 'my/nael-execute-file)
           :wk "run Lean file"
           :major-modes nael-mode))
