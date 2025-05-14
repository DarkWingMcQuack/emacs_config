(use-package c++-ts-mode
  :ensure nil
  :preface
  (defvar pretty-for-rgx
    (rx "for("
        (optional "const" (1+ space))
        (1+ (or word (syntax symbol)))  ; Loop variable
        (? "&" (? "&"))                 ; Optional references: & or &&
        (1+ space)
        (1+ (or word (syntax symbol)))  ; Type or variable name
        (1+ space)
        (group ":")                     ; The colon to be replaced (captured as group 1)
        (1+ space)
        (1+ (or word (syntax symbol))))  ; Range expression
    "Regular expression to match C++ range-based for loops.")

  (defun pretty-for-add-keywords ()
    "Add pretty symbols for C++ range-based for loops."
    (font-lock-add-keywords
     nil
     `((,pretty-for-rgx
        (1 (progn
             (compose-region (match-beginning 1) (match-end 1) "∈")
             nil))))))

  :custom
  (c-ts-mode-indent-offset 4)
  :init
  ;; Remap the standard C/C++ modes
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c-or-c++-mode . c-or-c++-ts-mode))

  :hook
  (c++-ts-mode . eglot-ensure)
  (c-ts-mode . eglot-ensure)
  (c++-ts-mode . pretty-for-add-keywords)

  (c++-ts-mode . (lambda () (setq-default c-basic-offset 4
                                     c-indent-level 4
                                     tab-width 4
                                     indent-tabs-mode nil))))
