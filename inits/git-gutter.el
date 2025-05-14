(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :custom
  (git-gutter-fr:side 'right-fringe)
  :hook
  (elpaca-after-init . global-git-gutter-mode))
