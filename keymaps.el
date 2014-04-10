;; Miscellaneous
(global-set-key [C-tab]          'mode-line-other-buffer)
(global-set-key [insert]         'nil) ; disable insert
(global-set-key [f4]             'bs-show)
(global-set-key (kbd "C-`")      'bs-show)
(global-set-key (kbd "C-c r r")  'recentf-open-files)
(global-set-key (kbd "C-x F")    'find-file-as-root)
;; (global-set-key (kbd "C-x k")    'close-buffer)
(global-set-key (kbd "C-x k")    'bury-buffer)
(global-set-key "\M- "           'dabbrev-expand)
(global-set-key (kbd "M-g M-g")  'goto-line-and-center)
(global-set-key (kbd "C-<f12>")  'toggle-frame-fullscreen)

; BM keybindings
(global-set-key [(meta m)]    'bm-toggle)
(global-set-key [(meta up)]   'bm-previous)
(global-set-key [(meta down)] 'bm-next)

;; ispell
(global-set-key (kbd "C-c f c")  'ispell-word)

;; jabber
(global-set-key (kbd "C-c j i")      'configure-chat-windows)
(global-set-key (kbd "C-c j r")      'jabber-display-roster)
(global-set-key (kbd "C-c j j")      'jabber-chat-with)
(define-key jabber-chat-mode-map (kbd "C-c j u") 'goto-address-at-point)
(define-key jabber-chat-mode-map [(meta return)] 'newline)

;; Magit / source control
(global-set-key (kbd "C-c g i")    'magit-status)
(global-set-key (kbd "C-c g a")    'vc-annotate)

;; Mu4e
(global-set-key (kbd "C-c m s")  'mu4e-headers-search)
(global-set-key (kbd "C-c m i")  'mu4e-up-to-date-status)
(define-key mu4e-main-mode-map (kbd "q") 'mu4e-quit-session)
(define-key mu4e-headers-mode-map (kbd "q") 'mu4e-quit-session)
(define-key mu4e-headers-mode-map (kbd "M-u") 'mu4e-update-mail-show-window)
(global-set-key (kbd "C-c m u")  'mu4e-update-mail-and-index)
(define-key mu4e-headers-mode-map (kbd "SPC") '(lambda()
                                                 (interactive)
                                                 (mu4e-headers-view-message)
                                                 (sleep-for 1)
                                                 (other-window -1)))

;; rinari
(global-set-key (kbd "C-c r m")  'rinari-find-model)
(global-set-key (kbd "C-c r v")  'rinari-find-view)
(global-set-key (kbd "C-c r c")  'rinari-find-controller)
(global-set-key (kbd "C-c r t")  'rinari-find-test)

;; ruby
(define-key ruby-mode-map [f2]   'occur-function-list)

;; Smex
(global-set-key (kbd "M-X") 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-x") 'smex)

;; undo tree
(global-set-key   [(ctrl z)]       'undo-tree-undo)
(global-set-key   [(ctrl shift z)] 'undo-tree-redo)

;; windmove
(global-set-key  [(meta right)] 'windmove-right)
(global-set-key  [(meta left)]  'windmove-left)
(global-set-key  [(meta up)]    'windmove-up)
(global-set-key  [(meta down)]  'windmove-down)
(global-set-key  [(meta control right)] 'enlarge-window-horizontally)
(global-set-key  [(meta control left)]  'shrink-window-horizontally)
(global-set-key  [(meta control up)]    'shrink-window)
(global-set-key  [(meta control down)]  'enlarge-window)


; Key Chords
(key-chord-define-global "xf"    'find-file)
(key-chord-define-global "cg"   'magit-status)

;; (global-set-key "\M-[1;2C"    'right-char)      ; Ctrl+right   => forward word
;; (global-set-key "\M-[1;2D"    'backward-word)     ; Ctrl+left    => backward word

;; (global-set-key "\M-[1;2C"    'buh)      ; Ctrl+right   => forward word
