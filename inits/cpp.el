(use-package modern-cpp-font-lock
  :defer t
  :hook
  (c-mode-common . (lambda ()
                     (setq-default c-basic-offset 4
                                   tab-width 4
                                   indent-tabs-mode nil)))
  (c-mode-common . modern-c++-font-lock-mode))
