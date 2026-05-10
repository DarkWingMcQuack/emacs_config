(use-package lsp-mode
  :commands (lsp lsp-deferred)

  :preface
  (defun my/lsp-deferred ()
    "Start LSP after applying the buffer's direnv environment when available."
    (unless (file-remote-p default-directory)
      (when (fboundp 'envrc-mode)
        (envrc-mode 1)))
    (lsp-deferred))

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

  :config
  (dolist (directory '("[/\\\\]\\.bloop\\'"
                       "[/\\\\]\\.bsp\\'"
                       "[/\\\\]\\.cache\\'"
                       "[/\\\\]\\.ccls-cache\\'"
                       "[/\\\\]\\.dart_tool\\'"
                       "[/\\\\]\\.direnv\\'"
                       "[/\\\\]\\.devenv\\'"
                       "[/\\\\]\\.elixir_ls\\'"
                       "[/\\\\]\\.gradle\\'"
                       "[/\\\\]\\.idea\\'"
                       "[/\\\\]\\.metals\\'"
                       "[/\\\\]\\.mypy_cache\\'"
                       "[/\\\\]\\.next\\'"
                       "[/\\\\]\\.pytest_cache\\'"
                       "[/\\\\]\\.ruff_cache\\'"
                       "[/\\\\]\\.scala-build\\'"
                       "[/\\\\]\\.stack-work\\'"
                       "[/\\\\]\\.svn\\'"
                       "[/\\\\]\\.tox\\'"
                       "[/\\\\]\\.venv\\'"
                       "[/\\\\]\\.vscode\\'"
                       "[/\\\\]\\.yarn\\'"
                       "[/\\\\]\\.zig-cache\\'"
                       "[/\\\\]CMakeFiles\\'"
                       "[/\\\\]Debug\\'"
                       "[/\\\\]Pods\\'"
                       "[/\\\\]Release\\'"
                       "[/\\\\]\\.pub-cache\\'"
                       "[/\\\\]\\.pub\\'"
                       "[/\\\\]\\.symlinks\\'"
                       "[/\\\\]_build\\'"
                       "[/\\\\]bazel-[^/\\\\]+\\'"
                       "[/\\\\]bazel-bin\\'"
                       "[/\\\\]bazel-out\\'"
                       "[/\\\\]bazel-testlogs\\'"
                       "[/\\\\]build\\'"
                       "[/\\\\]build-[^/\\\\]+\\'"
                       "[/\\\\]cmake-build-[^/\\\\]+\\'"
                       "[/\\\\]coverage\\'"
                       "[/\\\\]dist\\'"
                       "[/\\\\]dist-newstyle\\'"
                       "[/\\\\]elm-stuff\\'"
                       "[/\\\\]ephemeral\\'"
                       "[/\\\\]ios[/\\\\]Flutter\\'"
                       "[/\\\\]node_modules\\'"
                       "[/\\\\]out\\'"
                       "[/\\\\]project[/\\\\]project\\'"
                       "[/\\\\]target\\'"
                       "[/\\\\]venv\\'"
                       "[/\\\\]zig-cache\\'"))
    (add-to-list 'lsp-file-watch-ignored-directories directory))

  :general
  (general-define-key
   :keymaps 'lsp-mode-map
   :states 'normal
   "c w" '(my/jinx-correct-or-code-action :wk "correct word/code action")
   "g d" '(lsp-find-definition :wk "find declaration")
   "g R" '(lsp-rename              :wk "rename"))

  (general-define-key
   :states 'normal
   "g f" '(xref-go-forward :wk "xref go forward")
   "g b" '(xref-go-back :wk "xref go back"))

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "x r" '(xref-find-references   :wk "find references")))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-use-childframe t)


  ;; Keep LSP UI available on demand, but avoid per-line overlays while typing.
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  :general

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "d" '(lsp-ui-doc-glance :wk "show documentation")))


(use-package consult-lsp
  :after (consult lsp-mode)
  :general

  (my-leader
    :keymaps 'lsp-mode-map
    :states 'normal
    "p s" '(consult-lsp-symbols   :wk "find project symbols")
    "s e" '(consult-lsp-file-diagnostics :wk "show file diagnostics")))
