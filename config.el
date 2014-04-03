(cua-mode t)

;;
;; DISPLAY SETTINGS
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(global-linum-mode)
(setq-default truncate-lines t)


;;
;; BEHAVIOR SETINGS
;;

(ido-mode)
(global-undo-tree-mode)
(key-chord-mode 1)
(desktop-save-mode 1)

;;
;; DISPLAY FONTS AND FACES
;;

(set-default-font "Ubuntu Mono-12")
(setq default-frame-alist '((font . "Ubuntu Mono-12")))

(set-face-background 'show-paren-match-face "#666666")
