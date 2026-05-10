(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x pgtk))
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH" "SSH_AUTH_SOCK"))
  :config
  (exec-path-from-shell-initialize))
