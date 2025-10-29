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
