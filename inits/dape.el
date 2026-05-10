(use-package repeat
  :ensure nil
  :hook (elpaca-after-init . (lambda () (repeat-mode 1))))

(use-package dape
  :commands (dape
             dape-breakpoint-expression
             dape-breakpoint-log
             dape-breakpoint-remove-all
             dape-breakpoint-toggle
             dape-continue
             dape-evaluate-expression
             dape-info
             dape-kill
             dape-next
             dape-pause
             dape-quit
             dape-read-memory
             dape-repl
             dape-restart
             dape-select-stack
             dape-select-thread
             dape-step-in
             dape-step-out
             dape-watch-dwim)
  :custom
  (dape-buffer-window-arrangement 'right)
  (dape-info-hide-mode-line nil)
  (dape-inlay-hints t)

  :hook
  (dape-start . (lambda () (save-some-buffers t t)))
  (dape-display-source . pulse-momentary-highlight-one-line)
  (dape-compile . kill-buffer)

  :config
  (dape-breakpoint-global-mode 1)
  (dape-breakpoint-load)
  (add-hook 'kill-emacs-hook #'dape-breakpoint-save)

  :general
  (my-leader
    "d" '(:ignore t :wk "debug")
    "d d" '(dape :wk "start")
    "d b" '(dape-breakpoint-toggle :wk "breakpoint")
    "d B" '(dape-breakpoint-remove-all :wk "clear breakpoints")
    "d l" '(dape-breakpoint-log :wk "log breakpoint")
    "d e" '(dape-breakpoint-expression :wk "conditional breakpoint")
    "d c" '(dape-continue :wk "continue")
    "d n" '(dape-next :wk "next")
    "d i" '(dape-step-in :wk "step in")
    "d o" '(dape-step-out :wk "step out")
    "d p" '(dape-pause :wk "pause")
    "d r" '(dape-restart :wk "restart")
    "d q" '(dape-quit :wk "quit")
    "d k" '(dape-kill :wk "kill")
    "d R" '(dape-repl :wk "repl")
    "d I" '(dape-info :wk "info")
    "d t" '(dape-select-thread :wk "select thread")
    "d s" '(dape-select-stack :wk "select stack")
    "d x" '(dape-evaluate-expression :wk "evaluate")
    "d w" '(dape-watch-dwim :wk "watch")
    "d m" '(dape-read-memory :wk "memory")))
