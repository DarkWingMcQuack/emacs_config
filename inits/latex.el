(use-package auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :hook
  (LaTeX-mode . prettify-symbols-mode)
  (LaTeX-mode . eglot-ensure)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . TeX-fold-mode)


  :custom
  (TeX-electric-sub-and-superscript t)
  (TeX-electric-math (cons "$" "$"))
  (LaTeX-item-indent 2)
  (reftex-plug-into-AUCTeX t)


  :preface
  ;; Format math as a Latex string with Calc
  (defun my/latex-calc ()
    "Evaluate `calc' on the contents of line at point."
    (interactive)
    (cond ((region-active-p)
           (let* ((beg (region-beginning))
                  (end (region-end))
                  (string (buffer-substring-no-properties beg end)))
             (kill-region beg end)
             (insert (calc-eval `(,string calc-language latex
                                          calc-prefer-frac t
                                          calc-angle-mode rad)))))
          (t (let ((l (thing-at-point 'line)))
               (end-of-line 1) (kill-line 0)
               (insert (calc-eval `(,l
                                    calc-language latex
                                    calc-prefer-frac t
                                    calc-angle-mode rad))))))))
