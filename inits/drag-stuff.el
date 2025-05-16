(use-package drag-stuff
  :general
  ("M-j" '(drag-stuff-down  :wk "drag ↓"))
  ("M-k" '(drag-stuff-up    :wk "drag ↑"))
  ("M-l" '(drag-stuff-right :wk "drag →"))
  ("M-h" '(drag-stuff-left  :wk "drag ←"))

  :hook (elpaca-after-init . drag-stuff-global-mode))
