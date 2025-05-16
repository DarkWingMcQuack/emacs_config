(use-package which-key
  :hook (elpaca-after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.2)
  (which-key-allow-evil-operators t)                 ;; Show evil keybindings
  (which-key-sort-order 'which-key-key-order-alpha)) ;; Sort things alphabetical
