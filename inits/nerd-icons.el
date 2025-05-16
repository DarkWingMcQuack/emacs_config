(use-package nerd-icons)

(use-package nerd-icons-completion
  :after marginalia nerd-icons
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)
  (elpaca-after-init . (lambda () (nerd-icons-completion-mode))))
