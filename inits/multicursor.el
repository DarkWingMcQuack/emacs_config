;;; multicursor.el --- Evil multi-cursor setup -*- lexical-binding: t; -*-

(use-package evil-mc
  :after evil
  :demand t
  :preface
  (defface my/evil-mc-regexp-preview-face
    '((((class color) (background dark))
       :background "#665c00" :foreground "#ffffff" :weight bold)
      (((class color) (background light))
       :background "#ffe066" :foreground "#000000" :weight bold)
      (t :inverse-video t :weight bold))
    "Face used for live multi-cursor regexp previews.")

  (defvar my/evil-mc-regexp-preview-overlays nil
    "Preview overlays used while reading a multi-cursor regexp.")

  (defun my/evil-mc-clear-regexp-preview ()
    "Clear live regexp preview overlays."
    (mapc #'delete-overlay my/evil-mc-regexp-preview-overlays)
    (setq my/evil-mc-regexp-preview-overlays nil))

  (defun my/evil-mc-preview-regexp (buffer beg end regexp)
    "Preview up to 50 matches for REGEXP in BUFFER between BEG and END."
    (with-current-buffer buffer
      (my/evil-mc-clear-regexp-preview)
      (unless (string= regexp "")
        (save-excursion
          (goto-char beg)
          (condition-case nil
              (let ((count 0))
                (while (and (< count 50)
                            (< (point) end)
                            (re-search-forward regexp end t))
                  (let ((overlay (make-overlay (match-beginning 0)
                                               (match-end 0)
                                               buffer)))
                    (overlay-put overlay 'face 'my/evil-mc-regexp-preview-face)
                    (overlay-put overlay 'priority 1000)
                    (push overlay my/evil-mc-regexp-preview-overlays)
                    (setq count (1+ count)))
                  (when (and (= (match-beginning 0) (match-end 0))
                             (< (point) end))
                    (forward-char 1))))
            (invalid-regexp nil))))))

  (defun my/evil-mc-read-regexp (beg end)
    "Read a regexp while previewing matches between BEG and END."
    (let* ((source-buffer (current-buffer))
           (beg-marker (copy-marker beg))
           (end-marker (copy-marker end))
           (update-preview
            (lambda ()
              (my/evil-mc-preview-regexp
               source-buffer
               beg-marker
               end-marker
               (minibuffer-contents-no-properties)))))
      (unwind-protect
          (minibuffer-with-setup-hook
              (lambda ()
                (add-hook 'post-command-hook update-preview nil t))
            (read-regexp "Cursors for regexp"))
        (with-current-buffer source-buffer
          (my/evil-mc-clear-regexp-preview))
        (set-marker beg-marker nil)
        (set-marker end-marker nil))))

  (defun my/evil-mc-make-cursors-for-regexp (regexp &optional beg end)
    "Create Evil multiple cursors at each match for REGEXP.
When a region is active, only search inside that region.  Otherwise search from
point to the end of the buffer."
    (interactive
     (let ((beg (if (use-region-p) (region-beginning) (point)))
           (end (if (use-region-p) (region-end) (point-max))))
       (list (my/evil-mc-read-regexp beg end) beg end)))
    (require 'evil-mc)
    (let* ((beg (or beg (if (use-region-p) (region-beginning) (point))))
           (end (copy-marker (or end (if (use-region-p) (region-end) (point-max)))))
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
    "m" '(:ignore t :wk "multi-cursor"))

  (my-leader
    :states '(normal visual)
    "m m" '(evil-mc-make-cursor-here :wk "cursor here")
    "m n" '(evil-mc-make-and-goto-next-match :wk "add next match")
    "m N" '(evil-mc-make-and-goto-prev-match :wk "add previous match")
    "m a" '(evil-mc-make-all-cursors :wk "add all matches")
    "m j" '(evil-mc-make-cursor-move-next-line :wk "add line below")
    "m k" '(evil-mc-make-cursor-move-prev-line :wk "add line above")
    "m s" '(evil-mc-skip-and-goto-next-match :wk "skip next match")
    "m S" '(evil-mc-skip-and-goto-prev-match :wk "skip previous match")
    "m u" '(evil-mc-undo-last-added-cursor :wk "undo last cursor")
    "m q" '(evil-mc-undo-all-cursors :wk "clear cursors")
    "m p" '(evil-mc-pause-cursors :wk "pause cursors")
    "m P" '(evil-mc-resume-cursors :wk "resume cursors")
    "m /" '(my/evil-mc-make-cursors-for-regexp :wk "cursors from regexp")))
