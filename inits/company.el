(use-package company
  :preface
  (defun my/company-box-mode-maybe ()
    (when (display-graphic-p)
      (company-box-mode)))

  :hook
  (prog-mode   . company-mode)
  (text-mode   . company-mode)

  :custom
  (company-format-margin-function #'company-vscode-dark-icons-margin)
  (company-tooltip-align-annotations t)

  (company-tooltip-maximum-width 80)
  (company-tooltip-minimum-width 80)

  (company-backends '((company-capf company-files company-yasnippet)))
  (company-selection-wrap-around t)
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1)
  (company-require-match nil)
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
  :hook (company-mode . my/company-box-mode-maybe))

(use-package company-statistics
  :after company
  :hook
  (company-mode . company-statistics-mode))
