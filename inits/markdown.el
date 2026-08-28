(defcustom my/markdown-command-candidates
  '(("pandoc" "--from=gfm" "--to=html5" "--standalone")
    ("cmark-gfm" "--unsafe")
    ("cmark" "--unsafe")
    ("markdown_py" "-x" "fenced_code" "-x" "tables")
    ("markdown"))
  "Markdown renderers to try, in preference order."
  :type '(repeat (repeat string)))

(defun my/markdown-renderer-command ()
  "Return the first available Markdown renderer command."
  (catch 'command
    (dolist (command my/markdown-command-candidates)
      (when (executable-find (car command))
        (throw 'command command)))))

(defun my/markdown-command (begin end output-buffer)
  "Render Markdown between BEGIN and END into OUTPUT-BUFFER."
  (let ((command (my/markdown-renderer-command)))
    (unless command
      (user-error
       "Markdown preview needs pandoc, cmark-gfm, cmark, markdown_py, or markdown on PATH"))
    (let ((exit-code
           (apply #'call-process-region
                  begin end (car command) nil output-buffer nil (cdr command))))
      (unless (eq exit-code 0)
        (user-error "%s failed with exit code %s" (car command) exit-code)))))

(defun my/markdown-preview ()
  "Open a live preview for the current Markdown buffer."
  (interactive)
  (unless (derived-mode-p 'markdown-mode)
    (user-error "Current buffer is not Markdown"))
  (unless buffer-file-name
    (user-error "Markdown preview needs a file-backed buffer"))
  (unless (my/markdown-renderer-command)
    (user-error "Markdown preview needs pandoc, cmark-gfm, cmark, markdown_py, or markdown on PATH"))
  (if (bound-and-true-p markdown-live-preview-mode)
      (progn
        (markdown-live-preview-export)
        (when (buffer-live-p markdown-live-preview-buffer)
          (markdown-display-buffer-other-window markdown-live-preview-buffer)))
    (markdown-live-preview-mode 1)))

(use-package markdown-mode
  :commands (markdown-mode
             gfm-view-mode
             gfm-mode
             markdown-live-preview-mode
             markdown-live-preview-switch-to-output
             markdown-export
             markdown-preview)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :hook (markdown-mode . visual-line-mode)
  :custom
  (markdown-command #'my/markdown-command)
  (markdown-fontify-code-blocks-natively t)
  (markdown-live-preview-delete-export 'delete-on-destroy)
  (markdown-split-window-direction 'right))
