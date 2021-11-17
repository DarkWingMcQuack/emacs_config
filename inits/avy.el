(use-package avy
  :custom
  (avy-background t)
  (avy-all-windows t)

  :general

  ;; (general-define-key
  ;;  :states 'normal
  ;;  "q" 'avy-goto-char-timer)

  (my-leader 
	:states 'normal
	"j" '(avy-goto-line :wk "avy line jump")))
