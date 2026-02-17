(use-package mw-thesaurus
  :ensure (mw-thesaurus :host github :repo "agzam/mw-thesaurus.el")

  :hook
  (mw-thesaurus-mode . variable-pitch-mode)

  :config
  (add-to-list
   'display-buffer-alist
   `(,mw-thesaurus-buffer-name
     (display-buffer-reuse-window display-buffer-in-direction)
     (direction . right)
     (window . root)
     (window-width . 0.4)))

  :general
  (my-leader
    :states 'normal
    "l w" '(mw-thesaurus-lookup-at-point  :wk "lookup word")))


(use-package academic-phrases
  :ensure (academic-phrases :host github :repo "nashamri/academic-phrases")

  :commands (academic-phrases academic-phrases-by-section)

  :general
  (my-leader
    :states 'normal
    "l p" '(academic-phrases :wk "academic phrases")))

;; (use-package flymake-languagetool
;;   :hook
;;   (latex-mode      . flymake-languagetool-load)
;;   (LaTeX-mode      . flymake-languagetool-load)
;;   (org-mode        . flymake-languagetool-load)
;;   (markdown-mode   . flymake-languagetool-load)

;;   :custom

;;   (flymake-languagetool-server-jar nil)
;;   (flymake-languagetool-url "https://api.languagetool.org")

;;   :general
;;   (general-define-key
;;    :states 'normal
;;    "c w" '(flymake-languagetool-correct-at-point :wk "correct word")))
