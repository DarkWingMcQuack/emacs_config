(defvar my-leader-key "SPC"
  "The default leader key for my emacs config.")

(defvar my-leader-secondary-key "C-SPC"
  "The secondary leader key for my emacs config.")


(use-package general
  :commands (general-define-key
			 general-override-mode
			 general-evil-setup
			 general--simulate-keys)
  :custom
  (general-override-states '(insert
							 emacs
							 hybrid
							 normal
							 visual
							 motion
							 operator
							 replace))

  :config
  (general-override-mode)
  (general-evil-setup)
  (general-auto-unbind-keys)

  (general-create-definer my-leader
	:states '(motion normal emacs visual)
	:prefix my-leader-key
	:non-normal-prefix my-leader-secondary-key))
