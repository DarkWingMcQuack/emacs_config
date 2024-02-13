;; set font if it exists and if we are in a window system

(defun font-exists-p (font) (if (null (x-list-fonts font)) nil t))

(when (window-system)
  (cond ((font-exists-p "Fira Code") (set-frame-font "Fira Code:spacing=100:size=13" nil t))
    ((font-exists-p "monospace") (set-frame-font "monospace:spacing=100:size=16" nil t))))


