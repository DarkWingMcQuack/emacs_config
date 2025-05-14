(use-package consult
  :after flymake project
  :general
  (my-leader
    :states 'normal
    "s e" '(consult-flymake :wk "show errors")
    "p b" '(consult-project-buffer :wk "switch project buffer")
    "b f" '(consult-buffer :wk "switch buffer"))

  (general-define-key
    :states 'normal
    "M-p" '(consult-yank-pop :wk "yank pop")
    "F"  '(consult-line :wk "find line")
    "g l" '(consult-goto-line :wk "goto line")))
