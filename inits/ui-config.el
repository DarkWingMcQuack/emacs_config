;;; ui-config.el ---

;; disable ugly ass bullshit
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))

(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(size-indication-mode t)


;; stop prompting me, allright?
;; a) y is yes and n is no
(fset 'yes-or-no-p 'y-or-n-p)


(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package gruvbox-theme
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'gruvbox-dark-hard t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black"))))
  (evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black"))))
  (evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white")))
  (evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white")))
  (evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black"))))
  (evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))
  (doom-modeline-icon t)
  (doom-modeline-height 20))
;; ;;; ui-config.el ends here
