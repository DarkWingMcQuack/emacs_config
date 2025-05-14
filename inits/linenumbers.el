(use-package emacs
  :ensure nil
  :custom
  (display-line-numbers-type 'absolute)
  (display-line-numbers-width-start t)
  :hook
  (elpaca-after-init . global-display-line-numbers-mode))
