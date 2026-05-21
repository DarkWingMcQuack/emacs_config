(defcustom my/org-directory (expand-file-name "~/org/")
  "Directory for personal Org files."
  :type 'directory)

(defvar my/org-inbox-file (expand-file-name "inbox.org" my/org-directory))
(defvar my/org-notes-file (expand-file-name "notes.org" my/org-directory))
(defvar my/org-journal-file (expand-file-name "journal.org" my/org-directory))
(defvar my/org-notebook-file (expand-file-name "notebook.org" my/org-directory))

(defcustom my/org-babel-languages
  '((emacs-lisp . t)
    (shell . t)
    (python . t)
    (C . t)
    (java . t)
    (sqlite . t))
  "Org Babel languages enabled for executable source blocks."
  :type '(alist :key-type symbol :value-type boolean))

(defun my/org-ensure-files ()
  "Create the small Org workspace if it does not exist yet."
  (make-directory my/org-directory t)
  (dolist (file-title `((,my/org-inbox-file . "Inbox")
                        (,my/org-notes-file . "Notes")
                        (,my/org-journal-file . "Journal")))
    (unless (file-exists-p (car file-title))
      (with-temp-buffer
        (insert "#+title: " (cdr file-title) "\n\n")
        (write-file (car file-title))))))

(defun my/org-open-inbox ()
  "Open the Org inbox."
  (interactive)
  (my/org-ensure-files)
  (find-file my/org-inbox-file))

(defun my/org-open-notes ()
  "Open the Org notes file."
  (interactive)
  (my/org-ensure-files)
  (find-file my/org-notes-file))

(defun my/org-open-journal ()
  "Open the Org journal file."
  (interactive)
  (my/org-ensure-files)
  (find-file my/org-journal-file))

(defun my/org-open-notebook ()
  "Open a starter Org Babel notebook."
  (interactive)
  (my/org-ensure-files)
  (unless (file-exists-p my/org-notebook-file)
    (with-temp-buffer
      (insert "#+title: Org Notebook\n")
      (insert "#+property: header-args :results replace\n\n")
      (insert "* Scratch\n\n")
      (insert "Run the block at point with C-c C-c, or use SPC o b e.\n\n")
      (insert "#+begin_src emacs-lisp\n")
      (insert "(+ 1 2 3)\n")
      (insert "#+end_src\n\n")
      (insert "#+begin_src shell :results output\n")
      (insert "printf 'hello from %s\\n' \"$SHELL\"\n")
      (insert "#+end_src\n\n")
      (insert "#+begin_src python :results output\n")
      (insert "print('hello from python')\n")
      (insert "#+end_src\n\n")
      (insert "#+begin_src C++ :includes <iostream> :results output\n")
      (insert "std::cout << \"hello from C++\" << std::endl;\n")
      (insert "#+end_src\n\n")
      (insert "#+begin_src java :classname Main :results output\n")
      (insert "public class Main {\n")
      (insert "    public static void main(String[] args) {\n")
      (insert "        System.out.println(\"hello from Java\");\n")
      (insert "    }\n")
      (insert "}\n")
      (insert "#+end_src\n\n")
      (insert "* Notes\n\n")
      (write-file my/org-notebook-file)))
  (find-file my/org-notebook-file))

(defun my/org-capture-task ()
  "Capture a task into the Org inbox."
  (interactive)
  (my/org-ensure-files)
  (org-capture nil "t"))

(use-package org
  :ensure nil
  :demand t
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  :hook ((org-mode . org-num-mode)
         (org-mode . visual-line-mode))
  :custom
  (org-directory my/org-directory)
  (org-default-notes-file my/org-inbox-file)
  (org-agenda-files (list my/org-inbox-file my/org-notes-file my/org-journal-file))
  (org-startup-folded 'content)
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis "  ") ;; folding symbol
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-src-window-setup 'current-window)
  (org-edit-src-content-indentation 0)
  (org-confirm-babel-evaluate t)
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (org-refile-targets
   `((,my/org-inbox-file :maxlevel . 2)
     (,my/org-notes-file :maxlevel . 3)))
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  :config
  (require 'org-agenda)
  (require 'org-capture)
  (require 'org-tempo)
  (org-babel-do-load-languages 'org-babel-load-languages my/org-babel-languages)
  (setq org-babel-python-command "python3")
  (dolist (template '(("el" . "src emacs-lisp")
                      ("sh" . "src shell")
                      ("py" . "src python")
                      ("sql" . "src sqlite")
                      ("cpp" . "src C++")
                      ("java" . "src java")))
    (add-to-list 'org-structure-template-alist template))
  (setq org-agenda-span 7
        org-agenda-start-on-weekday nil
        org-agenda-custom-commands
        '(("d" "Dashboard"
           ((agenda "" ((org-agenda-overriding-header "This week")))
            (todo "NEXT" ((org-agenda-overriding-header "Next actions")))
            (todo "TODO" ((org-agenda-overriding-header "Inbox"))))))
        org-capture-templates
        `(("t" "Task" entry
           (file ,my/org-inbox-file)
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i\n%a")
          ("n" "Note" entry
           (file ,my/org-notes-file)
           "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i\n%a")
          ("j" "Journal" entry
           (file+olp+datetree ,my/org-journal-file)
           "* %U\n%?")))
  (my/org-ensure-files)
  :general
  (my-leader
    :states 'normal
    "o a" '(org-agenda :wk "agenda")
    "o c" '(org-capture :wk "capture")
    "o i" '(my/org-open-inbox :wk "inbox")
    "o j" '(my/org-open-journal :wk "journal")
    "o l" '(org-store-link :wk "store link")
    "o n" '(my/org-open-notes :wk "notes")
    "o N" '(my/org-open-notebook :wk "notebook")
    "o t" '(my/org-capture-task :wk "capture task")

    "o b" '(:ignore t :wk "babel")
    "o b b" '(org-babel-execute-buffer :wk "execute buffer")
    "o b e" '(org-babel-execute-src-block :wk "execute block")
    "o b s" '(org-edit-special :wk "edit block")
    "o b t" '(org-babel-tangle :wk "tangle")))

(use-package org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

(use-package org-modern
  :after org
  :hook
  (org-agenda-finalize . (lambda () (org-modern-agenda)))
  (org-mode . (lambda () (org-modern-mode))))


(use-package org-modern-indent
  :ensure(org-modern-indent
          :host github
          :repo "jdtsmith/org-modern-indent")

  :after (org org-modern)
  :hook (org-mode . org-modern-indent-mode))
