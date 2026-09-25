(defun my/nael-eldoc-preserve-faces ()
  "Keep the faces supplied by Lean and the Markdown renderer."
  (setq-local font-lock-global-modes nil)
  (font-lock-mode -1))

(defun my/nael-eldoc-display (docs interactive)
  "Display DOCS without re-fontifying the rendered ElDoc text."
  ;; ElDoc resets its major mode on every update.  Disable fontification
  ;; after that reset but before inserting the already propertized text.
  (let ((special-mode-hook
         (append special-mode-hook '(my/nael-eldoc-preserve-faces))))
    (eldoc-display-in-buffer docs interactive)))

(defun my/nael-eldoc-setup ()
  "Show full, formatted Lean documentation only in the ElDoc buffer."
  (setq-local eldoc-display-functions '(my/nael-eldoc-display))
  (setq-local lsp-eldoc-render-all t))

(use-package unicode-math-input
  :ensure t
  :hook (nael-mode . (lambda () (set-input-method "unicode-math"))))

(use-package nael
  :hook ((nael-mode . my/nael-eldoc-setup)
         (nael-mode . my/lsp-deferred))
  :vc ( :lisp-dir "nael"
        :url "https://codeberg.org/mekeor/nael.git")
  :config
  (font-lock-add-keywords
   'nael-mode
   `((,(regexp-opt
        '("aesop" "all_goals" "any_goals" "apply" "apply_rules"
          "assumption" "by_contra" "change" "clear" "congr"
          "contradiction" "constructor" "decide" "exact" "ext"
          "funext" "grind" "intro" "intros" "linarith"
          "native_decide" "nlinarith" "norm_num" "omega" "positivity"
          "push_neg" "rcases" "refine" "rfl" "ring" "ring_nf"
          "rintro" "rw" "simp" "simp_all" "simpa" "solve_by_elim"
          "specialize" "subst" "tauto" "trivial" "unfold" "use")
        'symbols)
       . font-lock-keyword-face))))

(use-package nael-lsp
  :after nael
  :vc ( :lisp-dir "nael-lsp"
        :url "https://codeberg.org/mekeor/nael.git")
  :config
  ;; lsp-mode advertises no refresh support; acknowledge Lean's request.
  (puthash "workspace/inlayHint/refresh" #'ignore
           (lsp--client-request-handlers (gethash 'nael lsp-clients))))
