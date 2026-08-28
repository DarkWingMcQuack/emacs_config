(use-package go-mode
  :mode "\\.go\\'"
  :after project
  :preface
  (defun my/project-find-go-module (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))

  (cl-defmethod project-root ((project (head go-module)))
    (cdr project))

  :hook
  ((go-mode . my/lsp-deferred)
   (go-ts-mode . my/lsp-deferred))

  :init
  (add-hook 'project-find-functions #'my/project-find-go-module))
