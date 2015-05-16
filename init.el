;; init.el - chiefly reserved for installing/loading/requiring packages
(require 'cl)

;;
;; PACKAGE MANAGEMENT
;;
(require 'package)
(add-to-list 'load-path "~/source/emacs-config")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)
(setq package-enable-at-startup nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '( ack
                       ag
                       auto-complete
                       bm
                       calfw
                       centered-window-mode
                       color-theme
                       dired+
                       dired-rainbow
                       dockerfile-mode
                       expand-region
                       fill-column-indicator
                       fiplr
                       flycheck
                       golden-ratio
                       helm
                       hydra
                       indent-guide
                       js2-mode
                       key-chord
                       lua-mode
                       magit
                       browse-kill-ring
                       popwin
                       powerline
                       rainbow-delimiters
                       rainbow-mode
                       railscasts-theme
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
(require 'smart-mode-line)
(require 'mu4e)
(require 'ruby-mode)
(require 'ruby-tools)
(require 'calfw)
(require 'popwin)
(require 'indent-guide)
(require 'color-theme-railscasts)

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
(load "aliases")
(load "keymaps")
(load "mu4e-settings")
(load "sql-presets.el")

;; load up the scratch perm file
(kill-buffer "*scratch*")
;;(find-file "~/docs/*^ scratch-perm")
;;(find-file "~/docs/*^ schedule")
;(toggle-frame-fullscreen)
