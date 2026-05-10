(defvar my/init-file-errors nil
  "Init files that failed to load during startup.")

(defun local-file-name (file-name)
  (let* ((file-path (expand-file-name file-name user-emacs-directory))
         (parent-dir (file-name-directory file-path)))
    (unless (or (not parent-dir)
                (file-exists-p parent-dir))
      (make-directory parent-dir))
    file-path))

(defun load-user-file (file)
  "Load a file in current user's configuration directory"
  (interactive "f")
  (let ((file-path (local-file-name file)))
    (condition-case err
        (load-file file-path)
      (error
       (push (cons file err) my/init-file-errors)
       (display-warning 'init
                        (format "Failed to load %s: %s"
                                file
                                (error-message-string err))
                        :error)))))

(add-hook 'emacs-startup-hook
          (lambda ()
            (when my/init-file-errors
              (message "Emacs loaded with %d init file error(s); check *Warnings*"
                       (length my/init-file-errors)))))

;;load core
(load-user-file "core/elpaca.el")
(load-user-file "inits/general.el")

(use-package compat)


;; Core behavior and persistence
(load-user-file "inits/no-littering.el")
(load-user-file "inits/execpfs.el")
(load-user-file "inits/gcmh.el")
(load-user-file "inits/prompt.el")
(load-user-file "inits/file-handling.el")
(load-user-file "inits/performance.el")
(load-user-file "inits/savehist.el")
(load-user-file "inits/saveplace.el")
(load-user-file "inits/undo.el")
(load-user-file "inits/sound.el")

;; UI
(load-user-file "inits/fonts.el")
(load-user-file "inits/theme.el")
(load-user-file "inits/nerd-icons.el")
(load-user-file "inits/modeline.el")
(load-user-file "inits/dashboard.el")
(load-user-file "inits/ligatures.el")
(load-user-file "inits/linenumbers.el")
(load-user-file "inits/centered-cursor.el")
(load-user-file "inits/which-key.el")
(load-user-file "inits/help.el")

;; Completion, search, and navigation
(load-user-file "inits/project.el")
(load-user-file "inits/orderless.el")
(load-user-file "inits/vertico.el")
(load-user-file "inits/marginalia.el")
(load-user-file "inits/consult.el")
(load-user-file "inits/company.el")
(load-user-file "inits/yasnippet.el")
(load-user-file "inits/dirvish.el")
(load-user-file "inits/treemacs.el")
(load-user-file "inits/crux.el")

;; Editing behavior
(load-user-file "inits/evil.el")
(load-user-file "inits/multicursor.el")
(load-user-file "inits/smartparens.el")
(load-user-file "inits/subword.el")
(load-user-file "inits/drag-stuff.el")
(load-user-file "inits/editorconfig.el")
(load-user-file "inits/ws-cleanup.el")
(load-user-file "inits/format.el")
(load-user-file "inits/rainbow.el")
(load-user-file "inits/hl-todo.el")
(load-user-file "inits/regex.el")

;; Programming infrastructure
(load-user-file "inits/direnv.el")
(load-user-file "inits/compile.el")
(load-user-file "inits/flycheck.el")
(load-user-file "inits/treesitter.el")
(load-user-file "inits/lsp.el")

;; Languages and formats
(load-user-file "inits/cmake.el")
(load-user-file "inits/cpp.el")
(load-user-file "inits/docker.el")
(load-user-file "inits/elisp.el")
(load-user-file "inits/elm.el")
(load-user-file "inits/flutter.el")
(load-user-file "inits/go.el")
(load-user-file "inits/java.el")
(load-user-file "inits/latex.el")
(load-user-file "inits/lean.el")
(load-user-file "inits/markdown.el")
(load-user-file "inits/nix.el")
(load-user-file "inits/org.el")
(load-user-file "inits/php.el")
(load-user-file "inits/python.el")
(load-user-file "inits/rust.el")
(load-user-file "inits/scala.el")
(load-user-file "inits/yaml.el")

;; Writing and VCS
(load-user-file "inits/spell.el")
(load-user-file "inits/writing.el")
(load-user-file "inits/git-gutter.el")
(load-user-file "inits/magit.el")
;; (load-user-file "inits/dimmer.el")
