;; Configure the default font

(defun my/font-setup ()
  (when (window-system)
    (if (member "Fira Code" (font-family-list))
        (set-frame-font "Fira Code:spacing=100:size=15" nil t)
      (set-frame-font "monospace:spacing=100:size=16" nil t))))

(add-hook 'after-init-hook 'my/font-setup)
