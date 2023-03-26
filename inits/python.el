(use-package python-mode
  :straight (:type built-in)
  :hook
  (python-mode . prettify-symbols-mode)
  (python-mode . (lambda ()
                   (mapc (lambda (pair) (push pair prettify-symbols-alist))
                         '(;; Syntax
                           ("not" .      #x2757)
                           ("in" .       #x2208)
                           ("not in" .   #x2209)
                           ;; Base Types
                           ("int" .      #x2124)
                           ("float" .    #x211d)))))
  )
