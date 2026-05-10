(use-package python
  :ensure nil
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

  :hook
  (python-ts-mode . my/lsp-deferred)
  (python-ts-mode . prettify-symbols-mode)
  (python-ts-mode . (lambda ()
                      (mapc (lambda (pair) (push pair prettify-symbols-alist))
                            '(;; Syntax
                              ("in" .       #x2208))))))

(use-package blacken
  :after python)
