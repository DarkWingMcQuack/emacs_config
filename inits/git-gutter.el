(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :preface
  (defun my/git-gutter-mode-maybe ()
    (when (and buffer-file-name
               (my/expensive-mode-safe-p))
      (my/enable-expensive-mode #'git-gutter-mode)))

  :custom
  (git-gutter-fr:side 'right-fringe)
  :hook
  (prog-mode . my/git-gutter-mode-maybe)
  (text-mode . my/git-gutter-mode-maybe)
  (conf-mode . my/git-gutter-mode-maybe))
