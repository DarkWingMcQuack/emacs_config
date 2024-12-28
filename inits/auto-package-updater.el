(use-package auto-package-update
  :defer 5
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  (auto-package-update-interval 4)
  :config
  (auto-package-update-maybe))
