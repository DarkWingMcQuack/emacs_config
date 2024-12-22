(defun local-file-name (file-name)
  (let* ((file-path (expand-file-name file-name user-emacs-directory))
         (parent-dir (file-name-directory file-path)))
    (unless (or (not parent-dir)
                (file-exists-p parent-dir))
      (make-directory parent-dir))
    file-path))

;; func which loads file in the init dir
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (local-file-name file)))

;;load core
(load-user-file "core/core-perf.el")
(load-user-file "core/straight.el")
(load-user-file "core/general.el")

(load-user-file "inits/evil.el")

(load-user-file "inits/auto-package-updater.el")
(load-user-file "inits/cape.el")
(load-user-file "inits/centered-cursor.el")
(load-user-file "inits/cmake.el")
(load-user-file "inits/consult.el")
(load-user-file "inits/corfu.el")
(load-user-file "inits/cpp.el")
(load-user-file "inits/dashboard.el")
(load-user-file "inits/dimmer.el")
(load-user-file "inits/docker.el")
(load-user-file "inits/drag-stuff.el")
(load-user-file "inits/eglot.el")
(load-user-file "inits/elisp.el")
(load-user-file "inits/file-handling.el")
(load-user-file "inits/flymake.el")
(load-user-file "inits/flyspell.el")
(load-user-file "inits/fonts.el")
(load-user-file "inits/gchm.el")
(load-user-file "inits/go.el")
(load-user-file "inits/haskell.el")
(load-user-file "inits/hl-todo.el")
(load-user-file "inits/keybindings.el")
(load-user-file "inits/ligatures.el")
(load-user-file "inits/linenumbers.el")
(load-user-file "inits/magit.el")
(load-user-file "inits/marginalia.el")
(load-user-file "inits/markdown.el")
(load-user-file "inits/mode-icons.el")
(load-user-file "inits/modeline.el")
(load-user-file "inits/multi-cursor.el")
(load-user-file "inits/my-return.el")
(load-user-file "inits/orderless.el")
(load-user-file "inits/org.el")
(load-user-file "inits/prescient.el")
(load-user-file "inits/prettify-symbols.el")
(load-user-file "inits/project.el")
(load-user-file "inits/python.el")
(load-user-file "inits/rainbow.el")
(load-user-file "inits/regexp.el")
(load-user-file "inits/rust.el")
(load-user-file "inits/savehist.el")
(load-user-file "inits/saveplace.el")
(load-user-file "inits/scala.el")
(load-user-file "inits/smartparens.el")
(load-user-file "inits/snippets.el")
(load-user-file "inits/subword.el")
(load-user-file "inits/tempel.el")
(load-user-file "inits/theme.el")
(load-user-file "inits/typescript.el")
(load-user-file "inits/ui-config.el")
(load-user-file "inits/undotree.el")
(load-user-file "inits/vertico.el")
(load-user-file "inits/which-key.el")
(load-user-file "inits/ws-cleanup.el")
(load-user-file "inits/yaml.el")
