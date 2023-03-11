(use-package flyspell
  :hook
  (text-mode . flyspell-mode)
  ;; (prog-mode . flyspell-prog-mode)

  :config
  (defun fd-switch-dictionary()
    "function to cycle between German end English dictionary"
    (interactive)
    (let* ((dic ispell-current-dictionary)
           (change (if (string= dic "deutsch8") "english" "deutsch8")))
      (ispell-change-dictionary change)
      (message "Dictionary switched from %s to %s" dic change)))

  (defun flyspell-ignore-http-and-https ()
    "Function used for `flyspell-generic-check-word-predicate'
     to ignore stuff starting with \"http\" or \"https\"."
    (save-excursion
      (forward-whitespace -1)
      (when (looking-at " ")
        (forward-char)
        (not (looking-at "https?\\b"))))) 

  (put 'text-mode 'flyspell-mode-predicate 'flyspell-ignore-http-and-https)

  :custom
  (flyspell-issue-message-flag nil)

  ;; don't correct my strings
  ;; https://emacs.stackexchange.com/questions/31300/can-you-turn-on-flyspell-for-comments-but-not-strings
  (flyspell-prog-text-faces '(font-lock-comment-face font-lock-doc-face))

  :general (general-define-key
            :keymaps 'flyspell-mode-map
            :states 'normal
            "<f9>" 'fd-switch-dictionary))

(use-package flyspell-correct
  :after flyspell
  :general (general-define-key
            :keymaps 'flyspell-mode-map
            :states 'normal
            "c w" 'flyspell-correct-wrapper))
