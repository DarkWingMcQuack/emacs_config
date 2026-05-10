(use-package helpful
  :commands (helpful-callable
             helpful-command
             helpful-function
             helpful-key
             helpful-symbol
             helpful-variable)
  :general
  (general-define-key
   [remap describe-command]  #'helpful-command
   [remap describe-function] #'helpful-callable
   [remap describe-key]      #'helpful-key
   [remap describe-symbol]   #'helpful-symbol
   [remap describe-variable] #'helpful-variable)

  (my-leader
    "h" '(:ignore t :wk "help")
    "h f" '(helpful-callable :wk "describe function")
    "h k" '(helpful-key :wk "describe key")
    "h s" '(helpful-symbol :wk "describe symbol")
    "h v" '(helpful-variable :wk "describe variable")))
