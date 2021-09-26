(use-package fira-code-mode
  :if window-system
  :custom (fira-code-mode-disabled-ligatures '("[]" "x"))  ; those ligatures suck
  :hook prog-mode) 
