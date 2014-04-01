(cua-mode t)

;;
;; DISPLAY SETTINGS
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(global-linum-mode)

;;
;; BEHAVIOR SETITINGS
;;

(ido-mode)
(global-undo-tree-mode)

;;
;; DISPLAY FONTS AND FACES
;;

(set-default-font "Ubuntu Mono-12")
(setq default-frame-alist '((font . "Ubuntu Mono-12")))

(set-face-background 'show-paren-match-face "#666666")
