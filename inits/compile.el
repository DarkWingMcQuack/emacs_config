(use-package compile
  :ensure nil
  :preface
  (defun my/project-root-directory ()
    "Return the current project root or `default-directory'."
    (or (when-let ((project (project-current nil default-directory)))
          (project-root project))
        default-directory))

  (defvar my/project-compile-root-files
    '("CMakeLists.txt"
      "build.sbt"
      "build.sc"
      "pubspec.yaml"
      "Cargo.toml"
      "go.mod"
      "pom.xml"
      "gradlew"
      "build.gradle"
      "build.gradle.kts"
      "package.json"
      "flake.nix"
      "Makefile"
      "makefile")
    "Files that identify a useful root for project compilation.")

  (defun my/project-compile-root-directory ()
    "Return the nearest build-root directory or the current project root."
    (or (catch 'root
          (dolist (file my/project-compile-root-files)
            (when-let ((root (locate-dominating-file default-directory file)))
              (throw 'root root))))
        (my/project-root-directory)))

  (defun my/project-file-exists-p (file)
    "Return non-nil when FILE exists in the current compile root."
    (file-exists-p (expand-file-name file (my/project-compile-root-directory))))

  (defun my/project-file-contains-p (file regexp)
    "Return non-nil when FILE in the current compile root matches REGEXP."
    (let ((path (expand-file-name file (my/project-compile-root-directory))))
      (when (file-readable-p path)
        (with-temp-buffer
          (insert-file-contents path)
          (re-search-forward regexp nil t)))))

  (defun my/project-compile-command ()
    "Guess a useful compile command for the current project."
    (cond
     ((my/project-file-exists-p "CMakeLists.txt")
      "cmake -S . -B build && cmake --build build")
     ((my/project-file-exists-p "build.sbt")
      "sbt compile")
     ((my/project-file-exists-p "build.sc")
      "mill __.compile")
     ((my/project-file-contains-p "pubspec.yaml" "^\\s-*flutter:")
      "flutter build linux")
     ((and (my/project-file-exists-p "pubspec.yaml")
           (my/project-file-exists-p "bin/main.dart"))
      "dart compile exe bin/main.dart")
     ((my/project-file-exists-p "pubspec.yaml")
      "dart test")
     ((my/project-file-exists-p "Cargo.toml")
      "cargo build")
     ((my/project-file-exists-p "go.mod")
      "go test ./...")
     ((my/project-file-exists-p "pom.xml")
      "mvn test")
     ((my/project-file-exists-p "gradlew")
      "./gradlew build")
     ((or (my/project-file-exists-p "build.gradle")
          (my/project-file-exists-p "build.gradle.kts"))
      "gradle build")
     ((my/project-file-exists-p "package.json")
      "npm run build")
     ((my/project-file-exists-p "flake.nix")
      "nix flake check")
     ((or (my/project-file-exists-p "Makefile")
          (my/project-file-exists-p "makefile"))
      "make")
     (t compile-command)))

  (defun my/project-compile ()
    "Run `compile' from the project root with a guessed command."
    (interactive)
    (let ((default-directory (my/project-compile-root-directory))
          (compile-command (my/project-compile-command)))
      (call-interactively #'compile)))

  (defun my/recompile ()
    "Re-run the last compilation command."
    (interactive)
    (save-some-buffers t)
    (recompile))

  :custom
  (compilation-always-kill t)
  (compilation-ask-about-save nil)
  (compilation-scroll-output 'first-error)
  (compilation-skip-threshold 2)

  :hook
  (compilation-filter . ansi-color-compilation-filter)

  :general
  (my-leader
    "c" '(:ignore t :wk "compile/code")
    "c c" '(my/project-compile :wk "compile")
    "c r" '(my/recompile :wk "recompile")
    "c k" '(kill-compilation :wk "kill compilation")
    "c n" '(next-error :wk "next error")
    "c p" '(previous-error :wk "previous error")))
