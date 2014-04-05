;;
;; DISPLAY SETTINGS
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(setq visible-bell t)
(global-linum-mode)
(setq-default truncate-lines t)
(global-hl-line-mode 1)
(column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p) ; stop forcing me to spell out "yes"

;;
;; BEHAVIOR SETINGS
;;

(cua-mode t)
(ido-mode)
(global-undo-tree-mode)
(key-chord-mode 1)
(desktop-save-mode 1)
(winner-mode)
(setq x-select-enable-clipboard t)
(setq kill-do-not-save-duplicates t)
(setq initial-scratch-message nil) ;don't show scratch message
(setq delete-by-moving-to-trash t)
(setq tags-revert-without-query 1)
(setq inhibit-startup-message t)
(setq backup-directory-alist '(("." . "~/backup-source"))) ; stop leaving backup~ turds scattered everywhere
(global-auto-revert-mode t)
(setq apropos-do-all t)
(rvm-use "ruby-1.9.3-p327-turbo" "tatango")

;; dired
(setq dired-isearch-filenames t)

;;
;; DISPLAY FONTS AND FACES
;;

(set-default-font "Ubuntu Mono-12")
(setq default-frame-alist '((font . "Ubuntu Mono-12")))

(set-face-background 'show-paren-match-face "#666666")
