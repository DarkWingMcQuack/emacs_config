(use-package corfu
  :defer 1
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-min-width 65)
  (corfu-max-width corfu-min-width)
  (corfu-count 15)
  (corfu-quit-no-match t)
  (corfu-popupinfo-hide t)
  (corfu-popupinfo-delay 0)
  (corfu-on-exact-match nil)

  :init
  (global-corfu-mode)

  :hook
  (corfu-mode . corfu-popupinfo-mode)
  (corfu-mode . corfu-history-mode)

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
  :defer 2
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
