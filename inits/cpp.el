(use-package modern-cpp-font-lock
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)))
  (modern-c++-font-lock-global-mode t))


