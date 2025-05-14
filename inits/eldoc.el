(use-package eldoc
  :ensure nil
  :defer t
  :hook (prog-mode . eldoc-mode))

(use-package eldoc-box
  :defer t
  :commands eldoc-box-help-at-point
  :general
  (my-leader
    :states 'normal
    "d" 'eldoc-box-help-at-point))
