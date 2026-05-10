(use-package emacs
  :ensure nil
  :preface
  (defcustom my/large-buffer-threshold (* 1024 1024)
    "Buffer size above which expensive minor modes should stay off."
    :type 'integer)

  (defun my/remote-buffer-p ()
    "Return non-nil when the current buffer belongs to a remote location."
    (file-remote-p default-directory))

  (defun my/large-buffer-p ()
    "Return non-nil when the current buffer is larger than `my/large-buffer-threshold'."
    (> (buffer-size) my/large-buffer-threshold))

  (defun my/expensive-mode-safe-p ()
    "Return non-nil when expensive minor modes are reasonable in this buffer."
    (not (or (minibufferp)
             (my/remote-buffer-p)
             (my/large-buffer-p)))))
