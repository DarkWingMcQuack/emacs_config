(use-package project
  :commands project-find-file project-switch-project
  :general
  (my-leader
    :states 'normal
    "pf" '(project-find-file :wk "find file in project")
    "pp" '(project-switch-project :wk "switch project")))
