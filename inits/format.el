(use-package emacs
  :ensure nil
  :preface
  (defun my/indent-buffer ()
    "Indent the whole buffer and remove trailing whitespace."
    (indent-region (point-min) (point-max))
    (delete-trailing-whitespace))

  (defun my/format-buffer ()
    "Format the current buffer with the best available formatter."
    (interactive)
    (save-excursion
      (cond
       ((and (derived-mode-p 'python-mode 'python-ts-mode)
             (require 'blacken nil t)
             (executable-find blacken-executable))
        (blacken-buffer))
       ((and (derived-mode-p 'elm-mode)
             (fboundp 'elm-format-buffer))
        (elm-format-buffer))
       ((and (bound-and-true-p lsp-mode)
             (fboundp 'lsp-format-buffer))
        (lsp-format-buffer))
       ((derived-mode-p 'emacs-lisp-mode)
        (my/indent-buffer)
        (untabify (point-min) (point-max)))
       (t
        (my/indent-buffer)))))

  :general
  (my-leader
    :keymaps 'override
    :states 'normal
    "TAB" '(my/format-buffer :wk "format buffer")))
