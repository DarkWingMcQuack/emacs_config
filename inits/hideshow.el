(use-package hideshow
  :commands hs-toggle-hiding
  :diminish hs-minor-mode
  :hook
  (emacs-lisp-mode . hs-minor-mode))

(use-package origami
  :hook
  (prog-mode . origami-mode)

  :general
  (general-define-key
   :states 'motion
   "z a" 'origami-forward-toggle-node
   "z c" 'origami-close-node
   "z C" 'origami-close-node-recursively))

(use-package lsp-origami
  :after (lsp origmao)
  :hook (lsp-after-open . lsp-origami-mode))
