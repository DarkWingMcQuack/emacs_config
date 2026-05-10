(use-package compile
  :ensure nil
  :preface
  (defun my/project-compile ()
    "Run `compile' from the current project root when available."
    (interactive)
    (let ((default-directory (or (when-let ((project (project-current)))
                                   (project-root project))
                                 default-directory)))
      (call-interactively #'compile)))

  (defun my/recompile ()
    "Re-run the last compilation command."
    (interactive)
    (save-some-buffers t)
    (recompile))

  :custom
  (compilation-always-kill t)
  (compilation-ask-about-save nil)
  (compilation-scroll-output 'first-error)
  (compilation-skip-threshold 2)

  :hook
  (compilation-filter . ansi-color-compilation-filter)

  :general
  (my-leader
    "c" '(:ignore t :wk "compile/code")
    "c c" '(my/project-compile :wk "compile")
    "c r" '(my/recompile :wk "recompile")
    "c k" '(kill-compilation :wk "kill compilation")
    "c n" '(next-error :wk "next error")
    "c p" '(previous-error :wk "previous error")))
