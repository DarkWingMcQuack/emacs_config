(use-package elm-mode
  :hook
  (elm-mode . eglot-ensure)
  (elm-mode . prettify-symbols-mode)
  (elm-mode . (lambda ()
                (mapc (lambda (pair) (push pair prettify-symbols-alist))
                      '(("->" . #x2192)
                        ("<-" . #x2190)
                        ("\\" . #x03BB)
                        ("=>" . #x21D2)
                        ("==" . #x2261)
                        ("/=" . #x2260)))))
  :general
  (my-leader
    :states 'normal
    :keymaps '(elm-mode-map)
    "TAB" 'elm-format-buffer))
