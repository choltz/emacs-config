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

(defvar my-packages '( ack
                       auto-complete
                       bm
                       calfw
                       color-theme
                       dired+
                       expand-region
                       fill-column-indicator
                       fiplr
                       flycheck
                       helm
                       jabber
                       js2-mode
                       key-chord
                       magit
                       rinari
                       ruby-end
                       ruby-tools
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
;; LAZY LOAD FUNCTIONS
;;
(autoload 'electric-occur            "electric-occur-mode/electric-occur-mode"       t)
(autoload 'search-content            "search-content"                                t)
(autoload 'ffap-string-at-point      "ffap"                                          t)

;;
;; EXPLICIT LOADS AND REQUIRES
;;
(load "vendor/color-theme-railscasts.el")
(require 'smart-mode-line)
(require 'jabber)
(require 'mu4e)
(require 'ruby-mode)
(require 'ruby-tools)
(require 'calfw)

;;
;; LOAD CONFIGURATION FILES
;;
(add-to-list 'load-path "~/source/emacs-config/")
(load "config")
(load "faces")
(load "general-functions")
(load "credentials")
(load "hooks")
(load "magit-config")
(load "jabber-functions")
(load "aliases")
(load "keymaps")
(load "mu4e-settings")
(load "sql-presets.el")

;; load up the scratch perm file
(kill-buffer "*scratch*")
(find-file "~/docs/*^ scratch-perm")
(toggle-frame-fullscreen)
