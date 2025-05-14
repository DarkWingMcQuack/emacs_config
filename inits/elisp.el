(use-package emacs-lisp-mode
  :ensure nil
  :defer t
  :preface
  (defun my/elisp-format-buffer ()
    "Indent, untabify, and strip trailing whitespace in the whole buffer."
    (interactive)
    (save-excursion
      (indent-region (point-min) (point-max))
      (untabify    (point-min) (point-max))
      (delete-trailing-whitespace)))

  (defun my/greek-lambda ()
    (font-lock-add-keywords nil `(("\\<lambda\\>"
                                   (0
                                    (progn
                                      (compose-region (match-beginning 0) (match-end 0)
                                                      ,(make-char 'greek-iso8859-7 107))
                                      nil))))))

  :hook
  (emacs-lisp-mode . my/greek-lambda)

  :general
  (my-leader
    :keymaps 'emacs-lisp-mode-map
    :states 'normal
    "TAB" '(my/elisp-format-buffer :wk "format elisp buffer")
    "b x" '(eval-buffer :wk "execute elisp buffer")))
