(use-package origami
  :hook
  (prog-mode . origami-mode)

  :general
  (general-define-key
   :states 'motion
   "z a" 'origami-recursively-toggle-node
   "z c" 'origami-close-node
   "z C" 'origami-close-node-recursively))

(use-package lsp-origami
  :after (lsp origmai)
  :hook (lsp-after-open . lsp-origami-mode))
