(use-package consult
  :commands (consult-flymake
             consult-project-buffer
             consult-buffer
             consult-yank-pop
             consult-line
             consult-goto-line)
  :general
  (my-leader
    "s e" '(consult-flymake :wk "show errors")
    "p b" '(consult-project-buffer :wk "switch project buffer")
    "b f" '(consult-buffer :wk "switch buffer"))

  (general-define-key
    :states 'normal
    "M-p" '(consult-yank-pop :wk "yank pop")
    "F"  '(consult-line :wk "find line")
    "g l" '(consult-goto-line :wk "goto line")))
