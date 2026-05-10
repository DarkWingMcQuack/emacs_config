(use-package emacs
  :ensure nil
  :config
  ;; All things UTF-8.
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)

  (setq backup-by-copying t
        make-backup-files t
        auto-save-interval 200
        auto-save-timeout 20
        delete-old-versions t
        kept-new-versions 6
        kept-old-versions 2
        version-control t
        delete-auto-save-files t)

  :hook
  ;; whenever an external process changes a file underneath emacs, and there
  ;; was no unsaved changes in the corresponding buffer, just revert its
  ;; content to reflect what's on-disk.
  (elpaca-after-init . global-auto-revert-mode))
