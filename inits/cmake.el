(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :after company
  :custom
  (cmake-tab-width 2)
  (cmake-indent-tab-width 2)
  :hook
  (cmake-ts-mode . (lambda ()
                     (setq-local company-backends
                                 '((company-cmake company-capf company-files company-yasnippet))))))
