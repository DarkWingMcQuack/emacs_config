(use-package cape)

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  (corfu-min-width 65)
  (corfu-max-width corfu-min-width)
  (corfu-count 15)
  (corfu-quit-no-match t)
  (corfu-popupinfo-hide t)
  (corfu-popupinfo-delay 0.1)
  (corfu-on-exact-match nil)

  :hook
  (prog-mode . corfu-mode)
  (text-mode . corfu-mode)
  (shell-mode . corfu-mode)
  (eshell-mode . corfu-mode)
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
