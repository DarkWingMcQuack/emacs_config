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
(load-user-file "core/core-env.el")
(load-user-file "core/core-server.el")

(load-user-file "inits/general.el")
(load-user-file "inits/fonts.el")
(load-user-file "inits/saveplace.el")
(load-user-file "inits/auto-package-updater.el")
(load-user-file "inits/dired.el")
(load-user-file "inits/regexp.el")
(load-user-file "inits/evil.el")
(load-user-file "inits/yaml.el")
(load-user-file "inits/prettify-symbols.el")
(load-user-file "inits/ivy.el")
(load-user-file "inits/lsp.el")
(load-user-file "inits/my-return.el")
(load-user-file "inits/cmake.el")
(load-user-file "inits/cpp.el")
(load-user-file "inits/swiper.el")

(load-user-file "inits/ui-config.el")
(load-user-file "inits/indent-guide.el")
(load-user-file "inits/linum.el")
(load-user-file "inits/drag-stuff.el")
(load-user-file "inits/origami.el")
(load-user-file "inits/which-key.el")
(load-user-file "inits/flycheck.el")
(load-user-file "inits/flyspell.el")
(load-user-file "inits/snippets.el")

(load-user-file "inits/company.el")
(load-user-file "inits/projectile.el")

(load-user-file "inits/magit.el")
(load-user-file "inits/elisp.el")
(load-user-file "inits/haskell.el")
(load-user-file "inits/file-handling.el")
(load-user-file "inits/undotree.el")
(load-user-file "inits/neotree.el")
(load-user-file "inits/rainbow.el")
(load-user-file "inits/smartparens.el")
(load-user-file "inits/markdown.el")
(load-user-file "inits/scala.el")
(load-user-file "inits/git-gutter.el")
(load-user-file "inits/docker.el")
(load-user-file "inits/typescript.el")
(load-user-file "inits/dashboard.el")
(load-user-file "inits/org.el")
(load-user-file "inits/keybindings.el")
(load-user-file "inits/subword.el")
(load-user-file "inits/hl-todo.el")
(load-user-file "inits/ws-cleanup.el")
(load-user-file "inits/unicode.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-insertion-on-trigger nil nil nil "Customized with use-package company")
 '(company-show-quick-access nil nil nil "Customized with use-package company")
 '(delete-selection-mode nil)
 '(tab-width 4)
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
