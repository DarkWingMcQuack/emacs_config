(use-package prescient
  :config
  (prescient-persist-mode))

(use-package corfu-prescient
  :after corfu
  :config (corfu-prescient-mode))
