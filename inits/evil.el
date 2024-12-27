(use-package evil
  :custom
  (evil-want-integration t) ;; This is optional since it's already set to t by default.
  (evil-want-keybinding nil)
  (evil-shift-width 2)
  (evil-default-state 'normal)
  :config
  (defun color-minibuffer (color)
      `(lambda ()
          (when (minibufferp)
              (face-remap-add-relative 'minibuffer-prompt :foreground ,color))))
  (add-hook 'evil-normal-state-entry-hook   (color-minibuffer "#8000FF"))
  (add-hook 'evil-insert-state-entry-hook   (color-minibuffer "#FF8000"))

  (evil-mode 1))

(use-package evil-nerd-commenter
  :after evil
  :defer 1
  :general
  (general-define-key
   :states 'normal
   "c c" 'evilnc-comment-or-uncomment-lines))

(use-package evil-collection
  :after evil
  :defer 1
  :custom
  (evil-collection-key-blacklist '("SPC" "m"))
  (evil-collection-setup-minibuffer t)
  (evil-collection-company-use-tng nil)
  :config
  (evil-collection-init))

(use-package evil-matchit
  :after evil
  :defer 1

  :init
  (define-key evil-normal-state-map "m" nil)
  (setq evilmi-shortcut "m")

  :config
  (global-evil-matchit-mode 1))

(use-package evil-org
  :after org
  :defer 3
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
