(use-package python-mode
  :ensure nil
  :defer t
  :hook
  (python-mode . prettify-symbols-mode)
  (python-mode . (lambda ()
                   (mapc (lambda (pair) (push pair prettify-symbols-alist))
                         '(;; Syntax
                           ("in" .       #x2208))))))

(use-package pet
  :defer t
  :hook (python-base-mode . pet-mode))

(use-package blacken
  :defer t
  :commands blacken-buffer
  :general
  (my-leader
    :states 'normal
    :keymaps 'python-mode-map
    "TAB" 'blacken-buffer))
