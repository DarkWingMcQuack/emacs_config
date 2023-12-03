(use-package dashboard
  :if (< (length command-line-args) 2)
  :custom
  (dashboard-startup-banner "~/.emacs.d/gnu2.png")
  (dashboard-image-banner-max-height 200)
  (dashboard-init-info nil)
  (dashboard-set-init-info nil)
  (dashboard-set-footer nil)
  (dashboard-items '((recents  . 5)
                     (projects . 5)
                     (agenda . 5)
                     (registers . 5)))
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :preface
  (defun my/dashboard-banner ()
    "Sets a dashboard banner including information on package initialization
     time and garbage collections."
    (setq dashboard-banner-logo-title
          (format "Emacs ready in %.2f seconds with %d garbage collections."
                  (float-time
                   (time-subtract after-init-time before-init-time)) gcs-done)))
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)


  :config
  (dashboard-setup-startup-hook))
