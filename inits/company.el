(use-package company
  :hook
  (prog-mode   . company-mode)
  (text-mode   . company-mode)
  (shell-mode  . company-mode)
  (eshell-mode . company-mode)

  :custom
  (company-backends '((company-capf company-files company-yasnippet)))
  (company-selection-wrap-around t)
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1)
  (company-transformers
   '(company-sort-prefer-same-case-prefix))


  :general
  (general-define-key
   :keymaps 'company-active-map
   "<tab>"     'company-select-next
   "TAB"       'company-select-next
   "<backtab>" 'company-select-previous
   "S-TAB"     'company-select-previous
   "<return>"  'company-complete-selection
   "RET"       'company-complete-selection))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(use-package company-statistics
  :after company
  :hook
  (company-mode . company-statistics-mode))
