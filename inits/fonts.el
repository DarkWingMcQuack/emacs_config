(use-package emacs
  :ensure nil
  :preface
  (defgroup my/fonts nil
    "My default-face font prefs."
    :group 'faces)

  (defcustom my/fira-code-font-family "Fira Code"
    "Preferred Fira Code font family name."
    :type 'string)

  (defcustom my/fira-code-symbol-font-family "Fira Code Symbol"
    "Font family used by `fira-code-mode' for ligature symbols."
    :type 'string)

  (defcustom my/font-primary-spec
    (font-spec :family my/fira-code-font-family :size 15)
    "Preferred font spec."
    :type 'font)

  (defcustom my/font-fallback-spec
    (font-spec :family "monospace" :size 16)
    "Fallback font spec."
    :type 'font)

  (defvar my/fira-code-missing-warning-shown nil
    "Whether the missing Fira Code warning has already been shown.")

  (defvar my/fira-code-symbol-missing-warning-shown nil
    "Whether the missing Fira Code Symbol warning has already been shown.")

  (defun my/fira-code-installed-p ()
    "Return non-nil when Fira Code is available to Emacs."
    (find-font (font-spec :family my/fira-code-font-family)))

  (defun my/fira-code-symbol-installed-p ()
    "Return non-nil when Fira Code Symbol is available to Emacs."
    (find-font (font-spec :family my/fira-code-symbol-font-family)))

  (defun my/warn-missing-fira-code ()
    "Warn once when Fira Code is not available."
    (unless my/fira-code-missing-warning-shown
      (setq my/fira-code-missing-warning-shown t)
      (display-warning 'fonts
                       "Fira Code is not installed; using fallback font and disabling fira-code-mode."
                       :warning)))

  (defun my/warn-missing-fira-code-symbol ()
    "Warn once when Fira Code Symbol is not available."
    (unless my/fira-code-symbol-missing-warning-shown
      (setq my/fira-code-symbol-missing-warning-shown t)
      (display-warning 'fonts
                       "Fira Code Symbol is not installed; disabling fira-code-mode to avoid broken ligature glyphs."
                       :warning)))

  (defun my/fira-code-mode-fonts-installed-p ()
    "Return non-nil when fonts required by `fira-code-mode' are available."
    (let ((fira-code-installed (my/fira-code-installed-p))
          (fira-code-symbol-installed (my/fira-code-symbol-installed-p)))
      (unless fira-code-installed
        (my/warn-missing-fira-code))
      (unless fira-code-symbol-installed
        (my/warn-missing-fira-code-symbol))
      (and fira-code-installed fira-code-symbol-installed)))

  (defun my/set-default-font-face (&optional frame)
    (when (window-system frame)
      (let ((spec (if (my/fira-code-installed-p)
                      my/font-primary-spec
                    (progn
                      (my/warn-missing-fira-code)
                      my/font-fallback-spec))))
        (set-face-attribute 'default frame :font spec))))


  (defvar my/font-size-step 10
    "Amount to change font height by in .1pt units (10 = 1 pt).")

  (defvar my/font-size-default
    (face-attribute 'default :height)
    "Original default font height, in .1pt units, as loaded at startup.")


  (defun my/adjust-font-size (&optional n)
    "Change the default face height by N * `my/font-size-step` (.1pt units).
  With no prefix arg N defaults to 1; a negative N will shrink the font."
    (let* ((step        my/font-size-step)
           (delta       (* step (or n 1)))
           (current-h   (face-attribute 'default :height))
           (new-h       (+ current-h delta)))
      (set-face-attribute 'default nil :height new-h)
      (message "Font size now %.1f pt" (/ new-h 10.0))))


  (defun my/increase-font-size ()
    "Increase the default font by one step."
    (interactive)
    (my/adjust-font-size 1))

  (defun my/decrease-font-size ()
    "Decrease the default font by one step."
    (interactive)
    (my/adjust-font-size -1))

  (defun my/reset-font-size ()
    "Restore the default font size to its original value."
    (interactive)
    (set-face-attribute 'default nil :height my/font-size-default)
    (message "Font size reset to default: %.1f pt"
             (/ my/font-size-default 10.0)))

  :hook (elpaca-after-init . my/set-default-font-face))

(use-package fira-code-mode
  :if (my/fira-code-mode-fonts-installed-p)
  :config
  (fira-code-mode-set-font)
  (global-fira-code-mode))
