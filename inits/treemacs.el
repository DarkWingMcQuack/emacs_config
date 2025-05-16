(use-package treemacs
  :commands treemacs-current-visibility
  :preface
  (defun my/treemacs-project-toggle ()
    "Toggle Treemacs.  If inside a project.el project, open at its root;
otherwise just toggle the last state."
    (interactive)
    (if (eq (treemacs-current-visibility) 'visible)
        (treemacs)
      (if (project-current)
          (treemacs-add-and-display-current-project-exclusively)
        (treemacs))))

  :custom
  (treemacs-width 30)
  (treemacs-no-png-images nil)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-is-never-other-window nil)
  (treemacs-silent-refresh    t)


  :general
  (my-leader
    :states 'normal
    :keymaps 'global
    "n" '(my/treemacs-project-toggle :wk "kill emacs")))

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))
