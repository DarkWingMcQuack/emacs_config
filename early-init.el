(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)


(setq gc-cons-threshold (* 1024 1024 1024))
(setq gc-cons-percentage 0.6)
(setq read-process-output-max (* 1024 1024 1024)) ;; 3mb
(setq process-adaptive-read-buffering nil)

;; speedup trick
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
      (lambda ()
        "Restore default values from our speedup trick after init."
        (setq file-name-handler-alist default-file-name-handler-alist)))
