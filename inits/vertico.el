(use-package vertico
  :custom
  (vertico-count 14)
  :config
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :straight nil
  :load-path "straight/repos/vertico/extensions/"
  :general
  (general-define-key
   :keymaps 'vertico-map
    "RET"  'vertico-directory-enter
    "DEL"  'vertico-directory-delete-char)
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package vertico-multiform
  :after vertico
  :straight nil
  :load-path "straight/repos/vertico/extensions/"
  :config (vertico-multiform-mode))


(use-package vertico-posframe
  :after vertico
  :preface
  (defun posframe-poshandler-frame-top-center-with-offset (info)
    "Posframe position at center top with offset."
    (cons (/ (- (plist-get info :parent-frame-width)
                (plist-get info :posframe-width))
             2)
          55))
  :custom
  (vertico-multiform-commands
   '((consult-line (:not posframe))
     (consult-flycheck (:not posframe))
     (consult-buffer (:not posframe))
     (t posframe)))

  (vertico-posframe-poshandler #'posframe-poshandler-frame-top-center-with-offset)
  (vertico-posframe-parameters '((internal-border-width . 1)
                                 (left-fringe . 5)
                                 (right-fringe . 5))
                               vertico-posframe-min-width 160
                               vertico-posframe-width 160
                               vertico-posframe-height 15)
  :config
  (vertico-posframe-mode t))
