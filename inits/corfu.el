(use-package corfu
  :straight (corfu :files (:defaults "extensions/*")
                   :includes (corfu-info))

  :after (savehist cape yasnippet yasnippet-capf eglot)

  :preface
  (defun my/eglot-capf ()
    (add-to-list 'completion-at-point-functions #'cape-file)
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'eglot-completion-at-point
                       :with 'yasnippet-capf))))

  (defun my/emacs-lisp-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'elisp-completion-at-point
                       :with 'yasnippet-capf))))
  :config
  (add-hook 'eglot-managed-mode-hook #'my/eglot-capf)
  (add-hook 'emacs-lisp-mode-hook #'my/emacs-lisp-capf)


  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-min-width 65)
  (corfu-max-width corfu-min-width)
  (corfu-count 15)
  (corfu-quit-no-match t)
  (corfu-popupinfo-hide t)
  (corfu-popupinfo-delay 0)
  (corfu-on-exact-match nil)


  :init
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (global-corfu-mode)

  :hook
  (corfu-mode . corfu-popupinfo-mode)

  :general
  (general-define-key
   :keymaps 'corfu-map
   "<tab>"     '(corfu-next :wk "cycle completion candidates")
   "TAB"     '(corfu-next :wk "cycle completion candidates")
   "RET"     '(corfu-insert :wk "expand completion candidate")
   "<return>"     '(corfu-insert :wk "expand completion candidate")
   "S-TAB"     '(corfu-previous :wk "previous completion candidates")
   "<backtab>"     '(corfu-previous :wk "previous completion candidates")))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package corfu-prescient
  :after corfu
  :hook (corfu-mode . corfu-prescient-mode))
