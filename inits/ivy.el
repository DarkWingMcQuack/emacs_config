(use-package flx)

(use-package ivy
  :config
  (setq ivy-re-builders-alist
        '((t . ivy--regex-fuzzy)))
  (ivy-mode)

  :after flx

  :custom
  (ivy-initial-inputs-alist nil)

  :general
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-j" 'ivy-immediate-done
   "RET" 'ivy-alt-done))

;; install smex before counsel to make Mx remember the commands we executed
(use-package smex)

(use-package counsel
  :after smex
  :config
  (counsel-mode)

  :general
  (my-leader
    "f f" '(counsel-find-file :wk "find file"))
  (general-define-key
   "M-x" 'counsel-M-x))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode)
  :general
  (my-leader
    "p p" '(counsel-projectile-switch-project :wk "switch project")
    "p f" '(counsel-projectile-find-file :wk "find project file")))

;; More friendly interface for ivy
;; https://github.com/Yevgnen/ivy-rich
(use-package ivy-rich
  :after (ivy counsel-projectile counsel ivy-xref)
  :config
  (ivy-rich-mode 1)
  :custom
  ;; For better performance
  ;; Better experience with icons
  (ivy-rich-parse-remote-buffer nil))

;; Better experience with icons for ivy
;; https://github.com/seagle0128/all-the-icons-ivy-rich/
(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode 1))

(use-package ivy-xref
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  :custom
  (xref-show-xrefs-function #'ivy-xref-show-xrefs "Use Ivy to show xrefs"))

(use-package lsp-ivy
  :after (ivy lsp))
