;; Miscellaneous
(global-set-key [C-tab]          'mode-line-other-buffer)
(global-set-key [insert]         'nil) ; disable insert
(global-set-key [f4]             'bs-show)
(global-set-key (kbd "C-`")      'bs-show)
(global-set-key (kbd "C-c r r")  'recentf-open-files)
(global-set-key (kbd "C-x F")    'find-file-as-root)
(global-set-key [f6]             'browse-kill-ring)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x k")    'bury-buffer)
(global-set-key (kbd "C-c k")    '(lambda() (interactive) (kill-buffer (buffer-name(current-buffer)))))
(global-set-key "\M- "           'er/expand-region)
(global-set-key (kbd "M-g M-g")  'goto-line-and-center)
(global-set-key (kbd "C-<f12>")  'toggle-frame-fullscreen)
;; (global-set-key [f5]             'search-content)
(global-set-key [f5]             'ag-project)
(global-set-key [f3]             'fiplr-find-file)
(global-set-key (kbd "C-x C-z")  'nil) ; disable irritating minimize behavior
(global-set-key (kbd "C-X F")    'find-file)
(global-set-key (kbd "C-x |")    'split-window-right)
(global-set-key (kbd "C-x \\")   'split-window-right)
(global-set-key (kbd "C-x -")    'split-window-below)

;; BM keybindings
(global-set-key [(meta m)]          'bm-toggle)
(global-set-key [(meta shift up)]   'bm-previous-and-center)
(global-set-key [(meta shift down)] 'bm-next-and-center)

;; Calendar
(global-set-key (kbd "C-c c i")    'cfw:open-calendar-buffer)

;; custom
(global-set-key (kbd "C-c h d")      'duplicate-line)
(global-set-key (kbd "C-c h f")      'ffap)

;; database
(global-set-key (kbd "C-c d i")  'mysql-tatango)
(global-set-key (kbd "C-c d t")  'mysql-tatango)
(global-set-key (kbd "C-c d a")  'mysql-albatross)
(global-set-key (kbd "C-c d p")  'psql-tatango)

;; dired
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-previous-line)

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
(global-set-key (kbd "C-c t")      'insert-initials-and-timestamp)

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

;; recentf
;(define-key recentf-mode-map "j" 'next-line)
;(define-key recentf-mode-map "k" 'previous-line)

;; ruby
;;(define-key ruby-mode-map [f2]   'occur-function-list)

;; Smex
(global-set-key (kbd "M-X") 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-x") 'smex)

;; undo tree
(global-set-key [(ctrl z)]       'undo-tree-undo)
(global-set-key [(ctrl shift z)] 'undo-tree-redo)
(global-set-key (kbd "C-c z i")  'undo-tree-visualize)

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
(key-chord-define-global "XF"    'find-file)
(key-chord-define-global "cg"   'magit-status)

;; (global-set-key "\M-[1;2C"    'right-char)      ; Ctrl+right   => forward word
;; (global-set-key "\M-[1;2D"    'backward-word)     ; Ctrl+left    => backward word

;; (global-set-key "\M-[1;2C"    'buh)      ; Ctrl+right   => forward word

(global-set-key
 (kbd "C-<f2>")
 (defhydra hydra-stuff ()
   "stuff"
   ("=" text-scale-increase)
   ("-" text-scale-decrease)))
