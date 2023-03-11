(use-package exec-path-from-shell
  :when (memq window-system '(mac ns x))
  :config
  (dolist (var '("LSP_USE_PLISTS"))
    (add-to-list 'exec-path-from-shell-variables var))

  (exec-path-from-shell-initialize))
