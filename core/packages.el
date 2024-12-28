(setq native-comp-async-report-warnings-errors nil
      native-comp-speed 3
      package-native-compile t
      native-comp-async-jobs-number 15)

(defvar native-comp-deferred-compilation-deny-list nil)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setopt use-package-always-ensure t)


(unless (package-installed-p 'vc-use-package)
  (package-vc-install "https://github.com/slotThe/vc-use-package"))

(eval-when-compile
  (require 'vc-use-package))
