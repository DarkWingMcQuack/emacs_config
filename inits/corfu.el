(use-package corfu
  :after (savehist cape tempel eglot)

  :preface
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
                (list (cape-capf-super
                       'eglot-completion-at-point
                       :with 'tempel-complete))))

  :config
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (add-hook 'eglot-managed-mode-hook #'my/eglot-capf)

  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 0)
  (corfu-popupinfo-delay '(0.25 . 0.1))
  (corfu-popupinfo-hide t)
  (corfu-min-width 65)
  (corfu-max-width corfu-min-width)
  (corfu-count 15)
  (corfu-quit-no-match t)

  :init
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
