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

(defvar my-packages '( auto-complete
                       bm
                       dired+
                       magit
                       jabber
                       js2-mode
                       key-chord
                       rvm
                       smart-mode-line
                       smex
                       undo-tree
                       web-mode
                       yaml-mode)

  "A list of packages to ensure are installed at launch.")
 (dolist (p my-packages)
   (when (not (package-installed-p p))
     (package-install p)))

;;
;; EXPLICIT LOADS AND REQUIRES
;;
(load "vendor/color-theme-railscasts.el")
(require 'smart-mode-line)

;;
;; LOAD CONFIGURATION FILES
;;
(add-to-list 'load-path "~/source/emacs-config/")
(load "config")
(load "general-functions")
(load "credentials")
(load "hooks")
(load "keymaps")
(load "magit-config")
(load "jabber-settings")
(load "aliases")
