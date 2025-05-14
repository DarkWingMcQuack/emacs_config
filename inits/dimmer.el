(use-package dimmer
  :after corfu
  :preface
  (defun advise-dimmer-config-change-handler ()
    "Advise to only force process if no predicate is truthy."
    (let ((ignore (cl-some (lambda (f) (and (fboundp f) (funcall f)))
                           dimmer-prevent-dimming-predicates)))
      (unless ignore
        (when (fboundp 'dimmer-process-all)
          (dimmer-process-all t)))))

  (defun corfu-frame-p ()
    "Check if the buffer is a corfu frame buffer."
    (string-match-p "\\` \\*corfu" (buffer-name)))

  (defun dimmer-configure-corfu ()
    "Convenience settings for corfu users."
    (add-to-list
     'dimmer-prevent-dimming-predicates
     #'corfu-frame-p))

  :custom
  (dimmer-fraction 0.4)

  :config
  (advice-add
   'dimmer-config-change-handler
   :override 'advise-dimmer-config-change-handler)
  (dimmer-configure-corfu)

  :hook (elpaca-after-init . (lambda ()(dimmer-mode t))))
