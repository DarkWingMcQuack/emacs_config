;; pretiffy c++ range based for loops

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

(add-hook 'c++-mode-hook #'pretty-for-add-keywords)
