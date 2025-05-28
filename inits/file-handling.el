(use-package emacs
  :ensure nil
  :config
  ;; All things UTF-8.
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)

  (setq backup-by-copying t)      ; don't clobber symlinks
  (setq backup-directory-alist `(("." . "~/.saves")))
  (setq make-backup-files t)         ; Enable backups
  (setq backup-by-copying t)         ; Don't overwrite symlinks

  (setq auto-save-file-name-transforms `((".*" "~/.saves" t)))
  (setq auto-save-list-file-prefix "~/.saves/") ; Location for auto-save list
  (setq auto-save-interval 200)      ; Auto-save interval
  (setq auto-save-timeout 20)       ; Auto-save timeout

  (setq lock-file-name-transforms `((".*" "~/.saves" t))) ; Set lockfiles to be stored in ~/.saves
  (setq delete-old-versions t)
  (setq kept-new-versions 6)
  (setq kept-old-versions 2)
  (setq version-control t)
  (setq delete-auto-save-files t) ; delete backup files once the file in question is saved

  :hook
  ;; whenever an external process changes a file underneath emacs, and there
  ;; was no unsaved changes in the corresponding buffer, just revert its
  ;; content to reflect what's on-disk.
  (elpaca-after-init . global-auto-revert-mode))
