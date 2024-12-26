(use-package eldoc
  :diminish eldoc-mode
  :after (corfu cape yasnippet yasnippet-capf)
  :defer t

  :preface
  (defun my/greek-lambda ()
    (font-lock-add-keywords nil `(("\\<lambda\\>"
                                   (0
                                    (progn
                                      (compose-region (match-beginning 0) (match-end 0)
                                                      ,(make-char 'greek-iso8859-7 107))
                                      nil))))))

  (defun my/emacs-lisp-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'elisp-completion-at-point
                       'yasnippet-capf
                       'cape-file))))

  :hook
  (emacs-lisp-mode . my/emacs-lisp-capf)
  (emacs-lisp-mode . turn-on-eldoc-mode)
  (emacs-lisp-mode . my/greek-lambda))
