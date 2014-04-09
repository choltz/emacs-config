(set-face-background 'show-paren-match-face "#666666")

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "#429907")
     (set-face-foreground 'magit-diff-del "#CB040F")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

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
