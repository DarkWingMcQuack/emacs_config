(use-package python-mode
  :straight (:type built-in)
  :defer t
  :hook
  (python-mode . prettify-symbols-mode)
  (python-mode . (lambda ()
                   (mapc (lambda (pair) (push pair prettify-symbols-alist))
                         '(;; Syntax
                           ("in" .       #x2208))))))
