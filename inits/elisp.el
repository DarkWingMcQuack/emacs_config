(use-package emacs-lisp-mode
  :ensure nil
  :preface
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
    "b x" '(eval-buffer            :wk "execute elisp buffer")))
