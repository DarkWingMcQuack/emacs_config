(use-package flycheck
  :custom
  (flycheck-display-errors-delay 1)
  (flycheck-check-syntax-automatically '(mode-enabled save new-line idle-change))
  :config
  (global-flycheck-mode)

  (defun switch-flycheck-list-errors ()
    (interactive)
    (flycheck-list-errors)
    (pop-to-buffer "*Flycheck errors*"))

  :general
  (my-leader 'flycheck-mode-map
    :states 'normal
    "s e" '(switch-flycheck-list-errors :wk "list errors")))


(use-package flycheck-pos-tip
  :after flycheck
  :hook (flycheck-mode . flycheck-pos-tip-mode))
