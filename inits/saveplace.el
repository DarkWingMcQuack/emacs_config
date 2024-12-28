(use-package saveplace
  :ensure nil
  :defer t
  :preface
  (defun save-place-reposition ()
    "Force windows to recenter current line (with saved position)."
    (run-with-timer 0 nil
                    (lambda (buf)
                      (when (buffer-live-p buf)
                        (dolist (win (get-buffer-window-list buf nil t))
                          (with-selected-window win (recenter)))))
                    (current-buffer)))
  :config
  (add-hook 'find-file-hook 'save-place-reposition t))
