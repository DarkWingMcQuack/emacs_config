(use-package neotree
  :after evil
  :config
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
  :bind
  ([f8] . neotree-project-dir)

  :custom
  (neo-theme (if (display-graphic-p) 'icons 'arrow))

  :general
  (general-define-key
   :keymaps 'neotree-mode-map
   :states 'normal

   "RET" '(neotree-enter :wk "enter")
   "c" '(neotree-create-node :wk "create node")
   "U" '(neotree-select-up-node :wk "go up a directory")
   "r" '(neotree-rename-node :wk "rename node")
   "d" '(neotree-delete-node :wk "delete node")
   "C" '(neotree-change-root :wk "change root")
   "H" '(neotree-hidden-file-toggle :wk "hidden files toggle")
   "q" '(neotree-hide :wk "hide neotree")))


(use-package all-the-icons
  :after neotree)
