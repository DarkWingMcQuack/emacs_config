;; If you are about to read this bullshit there
;; is a high propability you will get eye-cancer

(require 'smartparens (concat user-emacs-directory
                              (convert-standard-filename "inits/smartparens.el")))

(defun delete-ws-forward ()
  "Deletes all whitespace in front of cursor."
  (interactive)
  (delete-region (point)
                 (progn
                   (while (or (equal (char-after) ? )
                              (eolp))
                     (forward-char))
                   (point))))

(defun delete-ws-backward ()
  "Deletes all whitespace behind of cursor."
  (interactive)
  (delete-region (point)
                 (progn
                   (while (or (equal (char-before) ? )
                              (eolp))
                     (backward-char))
                   (point))))

(defun is-inside-oneline-comment ()
  "check if the cursor is currently in a oneline comment"
  (interactive)

  (let* ((line (thing-at-point 'line t))
         (regexp (concat "[[:space:]]*" comment-start "*.*$")))
    (string-match regexp line)))

(defun is-inside-multiline-comment ()
  "check if the cursor is currently in a multiline comment"
  (interactive)

  (let* ((last (point))
         (line-beginning 
          (progn (beginning-of-line) 
                 (point)))
         (result 
          (if (search-backward "*/" nil t)
              ;; there are some comment endings - search forward
              (search-forward "/*" last t)
            ;; it's the only comment - search backward
            (goto-char last)
            (search-backward "/*" nil t))))
    (progn
      (goto-char last)
      ;; (nth 4 (syntax-ppss)) checks if the cursor is currently in a comment
      ;; this avoids the problem of having "/*" as a string but not being in a comment
      (and (nth 4 (syntax-ppss))
           result))))

(defun my-super-return ()
  "My super return check for programming languages.
if we are in an sexp and dont have a , before the cursor and are not in a lisp
we delete ws before and after the cursor and then jump out of the sexp.
If the next character is a ; we just jump behind it.
If the cursor currently is in a singleline comment the next line is a comment as well
If the cursor is in a block comment the next line starts with a *
"
  (interactive)
  (cond ((and
          (looking-at-p "[[:space:]]*)")
          (not
           (looking-back 
            ",[[:space:]]*" 
            nil))
          ;; do not jump out of sexp if the major mode is a lisp-mode
          (not 
           (or 
            (derived-mode-p 'lisp-mode)
            (derived-mode-p 'emacs-lisp-mode))))
         (progn
           (delete-ws-forward)
           (delete-ws-backward)
           (sp-up-sexp)))

        ;; jump one char if the next char is just a ;
        ((and
          (looking-back ".*[[:space:]]*" nil)
          (looking-at-p "[[:space:]]*;")
          (not (string-match  ";+" comment-start)))
         (progn
           (delete-ws-forward)
           (delete-ws-backward)
           (forward-char)))

        ;; create newline with comment if current line is oneline comment
        ((is-inside-oneline-comment)
         (comment-indent-new-line))

        ;; create newline with * if current line is block comment
        ((is-inside-multiline-comment)
         (progn
           (insert "\n* ")
           (indent-for-tab-command))
         )

        (t (newline-and-indent))))


(general-define-key
 :keymaps 'prog-mode-map
 :states 'insert
 "RET" 'my-super-return)
