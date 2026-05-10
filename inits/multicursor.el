(use-package evil-mc
  :after evil
  :demand t
  :preface
  (defun my/evil-mc-make-cursors-for-regexp (regexp)
    "Create Evil multiple cursors at each match for REGEXP.
When a region is active, only search inside that region.  Otherwise search the
whole buffer."
    (interactive (list (read-regexp "Cursors for regexp")))
    (require 'evil-mc)
    (let* ((beg (if (use-region-p) (region-beginning) (point-min)))
           (end (copy-marker (if (use-region-p) (region-end) (point-max))))
           positions)
      (when (bound-and-true-p evil-local-mode)
        (evil-normal-state))
      (save-excursion
        (goto-char beg)
        (while (and (< (point) end)
                    (re-search-forward regexp end t))
          (push (match-beginning 0) positions)
          (when (and (= (match-beginning 0) (match-end 0))
                     (< (point) end))
            (forward-char 1))))
      (setq positions (nreverse positions))
      (if positions
          (progn
            (evil-mc-undo-all-cursors)
            (goto-char (car positions))
            (dolist (pos (cdr positions))
              (goto-char pos)
              (evil-mc-make-cursor-here))
            (goto-char (car positions))
            (message "Created %d cursor(s) for %S" (length positions) regexp))
        (message "No matches for %S" regexp))))

  :commands (evil-mc-make-all-cursors
             evil-mc-make-and-goto-next-match
             evil-mc-make-and-goto-prev-match
             evil-mc-make-cursor-here
             evil-mc-make-cursor-in-visual-selection-beg
             evil-mc-make-cursor-in-visual-selection-end
             evil-mc-make-cursor-move-next-line
             evil-mc-make-cursor-move-prev-line
             evil-mc-pause-cursors
             evil-mc-resume-cursors
             evil-mc-skip-and-goto-next-match
             evil-mc-skip-and-goto-prev-match
             evil-mc-undo-all-cursors
             evil-mc-undo-last-added-cursor)
  :config
  (global-evil-mc-mode 1)

  :general
  (my-leader
    "M" '(:ignore t :wk "multi-cursor"))

  (my-leader
    :states '(normal visual)
    "M m" '(evil-mc-make-cursor-here :wk "cursor here")
    "M n" '(evil-mc-make-and-goto-next-match :wk "add next match")
    "M N" '(evil-mc-make-and-goto-prev-match :wk "add previous match")
    "M a" '(evil-mc-make-all-cursors :wk "add all matches")
    "M j" '(evil-mc-make-cursor-move-next-line :wk "add line below")
    "M k" '(evil-mc-make-cursor-move-prev-line :wk "add line above")
    "M s" '(evil-mc-skip-and-goto-next-match :wk "skip next match")
    "M S" '(evil-mc-skip-and-goto-prev-match :wk "skip previous match")
    "M u" '(evil-mc-undo-last-added-cursor :wk "undo last cursor")
    "M q" '(evil-mc-undo-all-cursors :wk "clear cursors")
    "M p" '(evil-mc-pause-cursors :wk "pause cursors")
    "M P" '(evil-mc-resume-cursors :wk "resume cursors")
    "M /" '(my/evil-mc-make-cursors-for-regexp :wk "cursors from regexp")
    "M r" '(vr/replace :wk "regexp replace")
    "M R" '(vr/query-replace :wk "query regexp replace"))

  (my-leader
    :states 'visual
    "M i" '(evil-mc-make-cursor-in-visual-selection-beg :wk "cursors at starts")
    "M A" '(evil-mc-make-cursor-in-visual-selection-end :wk "cursors at ends")))
