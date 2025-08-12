(use-package java-mode
  :ensure nil
  :config

  (add-to-list 'major-mode-remap-alist '(java-mode . java-ts-mode))

  (with-eval-after-load 'eglot
    (setq eglot-workspace-configuration
          '(:java (:configuration (:updateBuildConfiguration "automatic")))))

  :hook
  (java-ts-mode . eglot-ensure))

(use-package jarchive
  :ensure t
  :after eglot
  :config
  (jarchive-setup))
