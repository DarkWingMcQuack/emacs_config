(use-package evil
  :preface
  (defun color-minibuffer (color)
    `(lambda ()
       (when (minibufferp)
         (face-remap-add-relative 'minibuffer-prompt :foreground ,color))))

  :custom
  (evil-want-integration t) ;; This is optional since it's already set to t by default.
  (evil-want-keybinding nil)
  (evil-shift-width 2)
  (evil-default-state 'normal)

  :config
  (evil-mode 1)
  (add-hook 'evil-normal-state-entry-hook (color-minibuffer "#8000FF"))
  (add-hook 'evil-insert-state-entry-hook (color-minibuffer "#FF8000")))

(use-package evil-nerd-commenter
  :after evil
  :commands evilnc-comment-or-uncomment-lines
  :general
  (general-define-key
   :states 'normal
   "c c" 'evilnc-comment-or-uncomment-lines))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-key-blacklist '("SPC" "m"))
  (evil-collection-setup-minibuffer t)
  (evil-collection-company-use-tng nil)
  :hook (after-init . evil-collection-init))

(use-package evil-matchit
  :after evil
  :preface
  (defun my/lazy-em ()
    (setq evilmi-shortcut "m")
    (define-key evil-normal-state-map "m" nil)
    (global-evil-matchit-mode))

  :hook (after-init . my/lazy-em))


(use-package evil-org
  :after (org evil)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . evil-org-set-key-theme))
