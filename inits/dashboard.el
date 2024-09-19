(use-package dashboard
  :custom
  (dashboard-startup-banner "~/.emacs.d/gnu2.png")
  ;; (dashboard-image-banner-max-height 300)
  ;; (dashboard-navigation-cycle t)
  ;; (dashboard-init-info nil)
  ;; (dashboard-set-init-info nil)
  ;; (dashboard-set-footer nil)
  ;; (dashboard-items '((recents  . 5)
  ;;                    (projects . 5)))
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)


  :config
  (dashboard-setup-startup-hook))

;; (use-package welcome-dashboard
;;   :straight (welcome-dashboard :type git :host github :repo "konrad1977/welcome-dashboard")
;;   :config
;;   (setq welcome-dashboard-latitude 56.7365
;;         welcome-dashboard-longitude 16.2981 ;; latitude and longitude must be set to show weather information
;;         welcome-dashboard-use-nerd-icons t ;; Use nerd icons instead of all-the-icons
;;         welcome-dashboard-path-max-length 75
;;         welcome-dashboard-use-fahrenheit nil ;; show in celcius or fahrenheit.
;;         welcome-dashboard-min-left-padding 10
;;         welcome-dashboard-image-file "~/.emacs.d/gnu2.png"
;;         welcome-dashboard-image-width 200
;;         welcome-dashboard-max-number-of-todos 5
;;         welcome-dashboard-image-height 169
;;         welcome-dashboard-title "free as in free speach, free as in free Beer")
;;   (welcome-dashboard-create-welcome-hook))
