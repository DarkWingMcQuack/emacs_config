(use-package doom-modeline
  :hook
  (elpaca-after-init . doom-modeline-mode)
  (doom-modeline-mode  . column-number-mode)

  :custom
  (doom-modeline-height 25)
  (doom-modeline-modal-modern-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)

  (doom-modeline-percent-position '(-3 "%p"))

  (doom-modeline-position-line-format   '("L%l"))
  (doom-modeline-position-column-format '("C%c"))
  (doom-modeline-position-column-line-format '("L%l C%c"))

  (doom-modeline-checker-simple-format nil)
  (doom-modeline-lsp t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-region-info t)
  (doom-modeline-project-detection 'project)
  (doom-modeline-project-icon t)
  (doom-modeline-workspace-name t))
