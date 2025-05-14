(use-package emacs
  :ensure nil
  :config
    ;; All things UTF-8.
    (prefer-coding-system 'utf-8)
    (set-default-coding-systems 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)

  :custom
    (create-lockfiles nil)     ; don't create lock files
    (delete-auto-save-files t) ; delete backup files once the file in question is saved
    (backup-by-copying t)      ; don't clobber symlinks
    (backup-directory-alist '(("." . "~/.saves/")))   ; don't litter my fs tree
    (delete-old-versions t)
    (kept-new-versions 6)
    (kept-old-versions 2)
    (version-control t)


  :hook
    ;; whenever an external process changes a file underneath emacs, and there
    ;; was no unsaved changes in the corresponding buffer, just revert its
    ;; content to reflect what's on-disk.
    (elpaca-after-init .global-auto-revert-mode t))
