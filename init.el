;; init.el - chiefly reserved for installing/loading/requiring packages
(require 'cl)

;;
;; PACKAGE MANAGEMENT
;;
(require 'package)
(add-to-list 'load-path "~/src/emacs-config")
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))

(add-to-list 'load-path "/home/choltz/src/vendor/mu/mu4e")

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
                       dumb-jump
                       expand-region
                       fill-column-indicator
                       fiplr
                       flycheck
                       flycheck-credo
                       flycheck-elixir
                       git-timemachine
                       golden-ratio
                       helm
                       hydra
                       indent-guide
                       js3-mode
                       key-chord
                       lua-mode
                       magit
                       mu4e-alert
                       browse-kill-ring
                       popwin
                       powerline
                       rainbow-delimiters
                       rainbow-mode
                       swiper
                       rinari
                       redo+
                       ruby-end
                       ruby-tools
                       rvm
                       smart-mode-line
                       smex
                       web-mode
                       yaml-mode
                       yasnippet)

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
(require 'flycheck-elixir)
(require 'smart-mode-line)
(require 'mu4e)
(require 'ruby-mode)
(require 'ruby-tools)
(require 'calfw)
(require 'popwin)
(require 'indent-guide)
(require 'color-theme-railscasts)
(require 'redo+)
(require 'yasnippet)

;;
;; LOAD CONFIGURATION FILES
;;
(add-to-list 'load-path "~/src/emacs-config/")
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
(mu4e)
;;(find-file "~/docs/*^ scratch-perm")
;;(find-file "~/docs/*^ schedule")
;(toggle-frame-fullscreen)
