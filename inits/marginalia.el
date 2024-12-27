(use-package marginalia
  :defer 1
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'center)
  :init
  (marginalia-mode))

(use-package nerd-icons
  :defer 1)

(use-package nerd-icons-completion
  :after marginalia
  :defer 2
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))
