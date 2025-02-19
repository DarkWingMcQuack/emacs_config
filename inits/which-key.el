(use-package which-key
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.2)                         ;; Reduce the time before which-key pops up
  (which-key-allow-evil-operators t)                 ;; Show evil keybindings
  (which-key-sort-order 'which-key-key-order-alpha)) ;; Sort things properly alphabetical

