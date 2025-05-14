(use-package python-mode
  :after eglot
  :hook
  (python-mode . eglot-ensure)
  (python-mode . prettify-symbols-mode)
  (python-mode . (lambda ()
                   (mapc (lambda (pair) (push pair prettify-symbols-alist))
                         '(;; Syntax
                           ("in" .       #x2208))))))

(use-package pet
  :after python
  :hook (python-base-mode . pet-mode))

(use-package blacken
  :after python
  :general
  (my-leader
    :states 'normal
    :keymaps 'python-mode-map
    "TAB" 'blacken-buffer))
