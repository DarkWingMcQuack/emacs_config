;; ;; set font if it exists and if we are in a window system

;; ;; (defun font-exists-p (font) (if (null (x-list-fonts font)) nil t))
;;  (defun font-exists-p (font)
;; ;;   "Return non-nil if FONT is in `font-family-list'."
;;    (member font (font-family-list)))


;;  (when (window-system)
;;    (cond ((font-exists-p "Fira Code") (set-frame-font "Fira Code:spacing=100:size=15" nil t))
;;      ((font-exists-p "monospace") (set-frame-font "monospace:spacing=100:size=16" nil t))))


;; Configure the default font
 (when (window-system)
   (if (member "Fira Code" (font-family-list))
       (set-frame-font "Fira Code:spacing=100:size=15" nil t)
     (set-frame-font "monospace:spacing=100:size=16" nil t)))
