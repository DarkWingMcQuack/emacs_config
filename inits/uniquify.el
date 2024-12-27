(use-package uniquify
  :straight (:type built-in)
  :defer 2
  :custom
  (uniquify-buffer-name-style 'forward)
  (uniquify-separator ":")
  ;; rename after killing uniquified
  (uniquify-after-kill-buffer-p t)
  ;; don't fuck with special buffers
  (uniquify-ignore-buffers-re "^\\*"))
