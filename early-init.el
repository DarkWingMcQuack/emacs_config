(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq package-enable-at-startup nil)
(setq package-quickstart nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq inhibit-default-init t)

;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
(setenv "LSP_USE_PLISTS" "true")
