(use-package python-mode
  :straight (:type built-in)
  :defer t
  :hook
  (python-mode . prettify-symbols-mode)
  (python-mode . (lambda ()
                   (mapc (lambda (pair) (push pair prettify-symbols-alist))
                         '(;; Syntax
                           ("in" .       #x2208))))))

(use-package pet
  :hook (python-base-mode . pet-mode))

(use-package blacken
  :general
  (my-leader
    :states 'normal
    :keymaps 'python-mode-map
    "TAB" 'blacken-buffer))
