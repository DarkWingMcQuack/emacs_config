(use-package nerd-icons :defer t)

(use-package nerd-icons-completion
  :defer t
  :after marginalia
  :preface
  (defun my/lazy-ni-completion () (nerd-icons-completion-mode))
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup)
  (after-init . my/lazy-ni-completion))


(use-package nerd-icons-corfu
  :after corfu nerd-icons
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
