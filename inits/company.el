(use-package company
  :init
  (global-company-mode)

  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1)
  (company-echo-delay 0)
  (company-auto-commit nil)
  (company-show-numbers nil)
  (company-tooltip-limit 15)
  (company-selection-wrap-around t)
  (company-require-match 'never)

  ;; width of the popup
  (company-tooltip-minimum-width 65)
  (company-tooltip-maximum-width 65)
  :general
  (general-define-key
   :keymaps 'company-active-map

   "<tab>"     '(company-select-next
				 :wk "cycle completion candidates")

   "<backtab>" '(company-select-previous
				 :wk "cycle completion candidates backwards")))

(use-package company-box
  :after company
  :hook
  (company-mode . company-box-mode))

(use-package company-statistics
  :after company
  :hook
  (company-mode . company-statistics-mode))
