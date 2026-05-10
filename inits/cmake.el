(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :after company
  :preface
  (defun my/cmake-company-backends ()
    (setq-local company-backends
                '((company-cmake company-capf company-files company-yasnippet))))

  :custom
  (cmake-tab-width 2)
  (cmake-indent-tab-width 2)
  :hook
  (cmake-mode . my/cmake-company-backends)
  (cmake-ts-mode . my/cmake-company-backends))
