(use-package projectile
  :diminish projectile-mode
  :custom
  (projectile-completion-system 'ivy)
  (projectile-switch-project-action 'projectile-find-file)

  :config
  (projectile-mode)

  :general
  (my-leader
    "p a" '(projectile-find-other-file :wk "find other file")))
