(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center)
  :init
  (marginalia-mode))

(use-package nerd-icons)
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))
