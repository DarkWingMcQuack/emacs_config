(use-package emacs
  :ensure nil
  :preface
  (defgroup my/fonts nil
  "My default-face font prefs."
  :group 'faces)

  (defcustom my/font-primary-spec
    (font-spec :family "Fira Code" :size 15)
    "Preferred font spec."
    :type 'font)

  (defcustom my/font-fallback-spec
    (font-spec :family "monospace" :size 16)
    "Fallback font spec."
    :type 'font)

  (defun my/set-default-font-face (&optional frame)
    (when (window-system frame)
      (let ((spec (if (find-font my/font-primary-spec)
		      my/font-primary-spec
		    my/font-fallback-spec)))
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
	  ;; FIXED: ATTRIBUTE comes second, no FRAME arg
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

  :hook (elpaca-after-init-hook . my/set-default-font-face))
