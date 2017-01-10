(set-face-background 'show-paren-match-face "#666666")

;; bm mode
(custom-set-faces
 '(bm-face ((t (:background "#492F03" :foreground "#999999")))))

;; company mode
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-preview           ((t (:inherit font-lock-constant-face))))
   '(company-preview-common    ((t (:inherit company-preview))))
   `(company-tooltip           ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg      ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg      ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common    ((t (:inherit font-lock-constant-face))))))

;; change magit diff colors
;; (eval-after-load 'magit
;;   '(progn
;;      (set-face-foreground 'magit-diff-add "#429907")
;;      (set-face-foreground 'magit-diff-del "#CB040F")
;;      (when (not window-system)
;;        (set-face-background 'magit-item-highlight "black"))))

;; flycheck
(custom-set-faces
 '(erm-syn-errline ((t (:box nil :underline (:color "red" :style wave)))))
 '(erm-syn-warnline ((t (:underline (:color "orange" :style wave))))))

;; jabber
(custom-set-faces
 '(jabber-chat-prompt-local ((t (:foreground "#5599ee" :weight bold))))
 '(jabber-chat-prompt-foreign ((t (:foreground "#E34141" :weight bold))))
 '(jabber-roster-user-online ((t (:foreground "#5599ee" :slant normal :weight bold)))))

;; smart mode line
(setq sml/override-theme t)
(setq sml/active-background-color "#444444")
(setq sml/inactive-background-color "#222222")
(set-face-attribute 'sml/filename nil :foreground "#CDBE64")
