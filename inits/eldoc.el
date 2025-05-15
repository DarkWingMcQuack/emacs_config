(use-package eldoc
  :ensure nil
  :hook (prog-mode . eldoc-mode))

(use-package eldoc-box
  ;; wait for https://github.com/casouri/eldoc-box/issues/128
  ;; to clarify this behaviour
  ;; :commands eldoc-box-help-at-point
  :general
  (my-leader
    :states 'normal
    "d" 'eldoc-box-help-at-point))
