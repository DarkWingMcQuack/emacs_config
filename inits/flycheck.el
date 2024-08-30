(use-package flycheck
  :custom
  (flycheck-display-errors-delay 1)
  (flycheck-indication-mode nil)
  (flycheck-check-syntax-automatically '(mode-enabled save new-line idle-change))
  :config
  (global-flycheck-mode))



(use-package flycheck-pos-tip
  :after flycheck
  :hook (flycheck-mode . flycheck-pos-tip-mode))
