(use-package flymake
  :hook (prog-mode . flymake-mode)
  :defer t
  :custom
  (flymake-no-changes-timeout 1))
