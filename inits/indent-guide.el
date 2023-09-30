;; (use-package highlight-indent-guides
;;   :hook
;;   (prog-mode . highlight-indent-guides-mode)

;;   :custom
;;   (highlight-indent-guides-method 'character)
;;   (highlight-indent-guides-character ?\┆)
;;   (highlight-indent-guides-auto-enabled nil)

;;   :config
;;   (set-face-background 'highlight-indent-guides-odd-face "orange")
;;   (set-face-background 'highlight-indent-guides-even-face "orange")
;;   (set-face-foreground 'highlight-indent-guides-character-face "orange"))

(use-package highlight-indentation
  :hook
  (prog-mode . highlight-indentation-mode)
  :custom
  (highlight-indentation-blank-lines t))
