(use-package general
  :custom
  (general-override-states '(insert
                             emacs
                             hybrid
                             normal
                             visual
                             motion
                             operator
                             replace))

  :config
  (general-override-mode)
  (general-evil-setup)
  (general-auto-unbind-keys)

  (general-create-definer my-leader
    :states '(motion normal emacs visual)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"))
