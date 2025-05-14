(use-package nerd-icons)

(use-package nerd-icons-completion
  :after marginalia nerd-icons
  :preface
  (defun my/lazy-ni-completion () (nerd-icons-completion-mode))
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)
  (elpaca-after-init . my/lazy-ni-completion))
