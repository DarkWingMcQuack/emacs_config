(use-package eldoc
  :ensure nil
  :after cape yasnippet-capf
  :preface
  ;; https://github.com/progfolio/elpaca/issues/236#issuecomment-1879838229
  (unload-feature 'eldoc t)
  (setq custom-delayed-init-variables '())
  (defvar global-eldoc-mode nil)

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

  (defun my/emacs-lisp-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'elisp-completion-at-point
                       'yasnippet-capf
                       'cape-file))))
  :general
  (my-leader
    :keymaps 'emacs-lisp-mode-map
    :states 'normal
    "TAB" '(my/elisp-format-buffer :wk "format elisp buffer")
    "b x" '(eval-buffer :wk "execute elisp buffer"))

  :config
  (global-eldoc-mode)

  :hook
  (emacs-lisp-mode . my/emacs-lisp-capf)
  (emacs-lisp-mode . turn-on-eldoc-mode)
  (emacs-lisp-mode . my/greek-lambda))
