(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'forward)
  (uniquify-separator ":")
  ;; rename after killing uniquified
  (uniquify-after-kill-buffer-p t)
  ;; don't fuck with special buffers
  (uniquify-ignore-buffers-re "^\\*"))
