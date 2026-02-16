(use-package go-mode
  :mode "\\.go\\'"
  :after project eglot
  :preface
  (defun project-find-go-module (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))

  (cl-defmethod project-root ((project (head go-module)))
    (cdr project))

  :hook
  (go-mode . lsp-deferred)

  :init
  (add-hook 'project-find-functions #'project-find-go-module))
