(use-package project
  :defer t
  :general
  (my-leader
   :states 'normal
    "pf" '(project-find-file :wk "find file in project")
    "pp" '(project-switch-project :wk "find file in project")))
