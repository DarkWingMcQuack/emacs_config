(use-package corfu
  :general
  (:keymaps 'corfu-map
            [tab] '(corfu-next
					:wk "cycle completion candidates")

            [backtab] '(corfu-previous
						:wk "cycle completion candidates backwards")

            [escape] '(corfu-quit
					   :wk "quit completion")

            [return] '(corfu-insert
					   :wk "insert the current completion candidate"))

  :custom 
  (corfu-auto t) 
  (corfu-auto-prefix 1)
  (corfu-auto-delay 0.1)
  (corfu-preselect-first nil)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-count 15)
  (corfu-echo-documentation nil) 
  (tab-always-indent 'complete)
  (completion-cycle-threshold 20)
  (corfu-cycle t)

  :init
  (global-corfu-mode))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil)  ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08)

  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package corfu-doc
  ;; NOTE 2022-02-05: At the time of writing, `corfu-doc' is not yet on melpa
  :after corfu
  :hook (corfu-mode . corfu-doc-mode)

  :general
  (:keymaps 'corfu-map
            ;; Scroll in the documentation window
            "M-n" #'corfu-doc-scroll-up
            "M-p" #'corfu-doc-scroll-down)
  :custom
  (corfu-doc-delay 0.5))
