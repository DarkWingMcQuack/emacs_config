;;; ui-config.el ---

;; disable ugly ass bullshit
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)



;; stop prompting me, alright?
;; a) y is yes and n is no
(fset 'yes-or-no-p 'y-or-n-p)
