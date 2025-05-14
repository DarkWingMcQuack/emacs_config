(use-package doom-modeline
  :hook (elpaca-after-init . doom-modeline-mode)
  :custom
  (doom-modeline-modal-modern-icon t)
  (doom-modeline-height 25)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-percent-position '(-3 "%p"))
  (doom-modeline-position-column-line-format '("%l:%c")))
