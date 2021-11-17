(use-package crux
  :demand t)


(general-define-key
 :states 'normal
 "g l" '(goto-line :wk "goto line")
 "q"   '(delete-window :wk "delete current window"))

(my-leader
  "b" '(:ignore t :wk "buffers")
  "p" '(:ignore t :wk "project")
  "f" '(:ignore t :wk "files")
  "g" '(:ignore t :wk "git")
  "o" '(:ignore t :wk "org")
  "w" '(:ignore t :wk "windows"))


(defun my-open-term()
  (interactive)
  (if (string-equal (buffer-name) "*terminal*")
	  (delete-window)
	(progn
	  (split-window-below -15)
	  (other-window -1)
	  (term "/bin/fish")
	  (evil-normal-state)
	  (move-end-of-line nil))))

(defun my-format-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))


(my-leader
  :keymaps 'override
  "t" '(my-open-term :wk "open terminal")

  "q q" '(save-buffers-kill-terminal :wk "fill screen")

  "w f" '(toggle-frame-fullscreen :wk "fill screen")
  "w h" '(split-window-horizontally :wk "horizontal split")
  "w v" '(split-window-vertically :wk "vertival split")
  "w w" '(other-window :wk "goto next window")
  "w o" '(delete-other-windows :wk "delete other windows")
  "w d" '(delete-window :wk "delete current window")
  "w s" '(crux-transpose-windows :wk "switch windows")

  "TAB" '(my-format-buffer :wk "format buffer")

  "b b" '(crux-switch-to-previous-buffer :wk "switch to last buffer")
  "b x" '(eval-buffer :wk "execute elisp buffer")
  "b f" '(switch-to-buffer :wk "find buffer")
  "b d" '(kill-this-buffer :wk "kill current buffer")
  "b q" '(crux-kill-other-buffers :wk "kill other buffers")

  "f s" '(save-buffer :wk "save current buffer")
  "f r" '(crux-rename-file-and-buffer :wk "rename file")
  "f d" '(dired :wk "dired"))
