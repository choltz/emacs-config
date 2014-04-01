;; init.el - chiefly reserved for installing/loading/requiring packages
(require 'cl)

;;
;; PACKAGE MANAGEMENT
;;
(require 'package)
(add-to-list 'load-path "~/source/emacs-config")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/"))

(package-initialize)
(setq package-enable-at-startup nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(magit
		      key-chord
                      smex)
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load "vendor/color-theme-railscasts.el")

;;
;; LOAD CONFIGURATION FILES
;;
(add-to-list 'load-path "~/source/emacs-config/")
(load "config")
(load "keybindings")
