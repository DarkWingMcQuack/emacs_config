(use-package general
  :ensure (:wait t)
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
  (general-auto-unbind-keys)
  (general-evil-setup)

  (general-create-definer my-leader
    :states '(motion normal emacs visual)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")

  (general-define-key
    :states 'normal
    "q"   '(delete-window :wk "delete current window"))

  (my-leader
    "b" '(:ignore t :wk "buffers/bookmarks")
    "p" '(:ignore t :wk "project")
    "q" '(:ignore t :wk "quit")
    "f" '(:ignore t :wk "files")
    "g" '(:ignore t :wk "git")
    "o" '(:ignore t :wk "org")
    "s" '(:ignore t :wk "snippets/marks")
    "r" '(:ignore t :wk "regex")
    "w" '(:ignore t :wk "windows"))

  (my-leader
    :keymaps 'override
    "q q" '(save-buffers-kill-terminal :wk "kill emacs")

    "w f" '(toggle-frame-fullscreen   :wk "fill screen")
    "w h" '(split-window-horizontally :wk "horizontal split")
    "w v" '(split-window-vertically   :wk "vertival split")
    "w w" '(other-window              :wk "goto next window")
    "w o" '(delete-other-windows      :wk "delete other windows")
    "w d" '(delete-window             :wk "delete current window")

    "b x" '(eval-buffer         :wk "execute elisp buffer")
    "b f" '(switch-to-buffer    :wk "find buffer")
    "b d" '(kill-current-buffer :wk "kill current buffer")

    "b a" '(bookmark-set    :wk "add new bookmark")
    "b j" '(bookmark-jump   :wk "jump to bookmark")
    "b q" '(bookmark-delete :wk "delete bookmark")
    "b l" '(list-bookmarks  :wk "list all bookmarks")
    "b s" '(bookmark-save   :wk "save bookmarks")

    "s a" '(set-mark-command          :wk "set mark here")
    "s e" '(exchange-point-and-mark   :wk "exchange mark and point")
    "s s" '(consult-mark              :wk "show mark-ring")

    "f f" '(find-file   :wk "find file")
    "f s" '(save-buffer :wk "save current buffer")))
