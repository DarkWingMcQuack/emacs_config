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

(defun my/markdown-preview (&optional quiet)
  "Open a live preview for the current Markdown buffer.
When QUIET is non-nil, report setup problems with `message' instead
of signaling an error."
  (interactive)
  (cond
   ((not (derived-mode-p 'markdown-mode))
    (if quiet
        (message "Markdown preview skipped: current buffer is not Markdown")
      (user-error "Current buffer is not Markdown")))
   ((not buffer-file-name)
    (if quiet
        (message "Markdown preview skipped: buffer does not visit a file")
      (user-error "Markdown preview needs a file-backed buffer")))
   ((not (my/markdown-renderer-command))
    (if quiet
        (message "Markdown preview skipped: install pandoc, cmark-gfm, cmark, markdown_py, or markdown")
      (user-error "Markdown preview needs pandoc, cmark-gfm, cmark, markdown_py, or markdown on PATH")))
   ((bound-and-true-p markdown-live-preview-mode)
    (markdown-live-preview-export)
    (when (buffer-live-p markdown-live-preview-buffer)
      (markdown-display-buffer-other-window markdown-live-preview-buffer)))
   (t
    (markdown-live-preview-mode 1))))

(defun my/markdown-preview-maybe ()
  "Open Markdown live preview when possible."
  (my/markdown-preview t))

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
  :hook ((markdown-mode . visual-line-mode)
         (gfm-mode . visual-line-mode)
         (markdown-mode . my/markdown-preview-maybe)
         (gfm-mode . my/markdown-preview-maybe))
  :custom
  (markdown-command #'my/markdown-command)
  (markdown-fontify-code-blocks-natively t)
  (markdown-live-preview-delete-export 'delete-on-destroy)
  (markdown-split-window-direction 'right))
