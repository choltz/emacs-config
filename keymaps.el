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
(global-set-key (kbd "C-<f12>")  'toggle-frame-fullsceren)
;; (global-set-key [f5]             'search-content)
(global-set-key [f5]             'ag-project)
(global-set-key [f3]             'fiplr-find-file)
(global-set-key (kbd "C-x C-z")  'nil) ; disable irritating minimize behavior
(global-set-key (kbd "C-X F")    'find-file)
(global-set-key (kbd "C-x |")    'split-window-right)
(global-set-key (kbd "C-x \\")   'split-window-right)
(global-set-key (kbd "C-x -")    'split-window-below)
; (global-set-key (kbd "C-s")      'swiper)

(global-set-key [f12]             'kmacro-end-and-call-macro)


;; BM keybindings
(global-set-key [(meta m)]          'bm-toggle)
(global-set-key [(meta shift up)]   'bm-previous-and-center)
(global-set-key [(meta shift down)] 'bm-next-and-center)

;; Calendar
(global-set-key (kbd "C-c c i")    'cfw:open-calendar-buffer)

;; custom
(global-set-key (kbd "C-c h d")      'duplicate-line)
(global-set-key (kbd "C-c h f")      'ffap)
(global-set-key (kbd "C-c h c")      'ispell-word)

;; dired
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-previous-line)

;; dumb-jump
(global-set-key [(meta .)] 'dumb-jump-go)

;; elfeed
(define-key elfeed-search-mode-map "j" 'next-line)
(define-key elfeed-search-mode-map "k" 'previous-line)
(define-key elfeed-show-mode-map "j" 'elfeed-goodies/split-show-next)
(define-key elfeed-show-mode-map "k" 'elfeed-goodies/split-show-prev)

;; file operations
(global-set-key (kbd "C-c f t")    '(lambda()
                                      (interactive)
                                      (find-file "~/shared/*^ scratch-perm")))
(global-set-key (kbd "C-c f s")    '(lambda()
                                      (interactive)
                                      (find-file "~/shared/*^ schedule")))
(global-set-key (kbd "C-c f l")    '(lambda()
                                      (interactive)
                                      (find-file "~/shared/*^ log")))


;; Magit / source control
(global-set-key (kbd "C-c g i")    'magit-status)
(global-set-key (kbd "C-c g a")    'vc-annotate)
(global-set-key (kbd "C-c t")      'insert-initials-and-timestamp)

;; Mu4e
(global-set-key (kbd "C-c m s")  'mu4e-headers-search)
(global-set-key (kbd "C-c m i")  'mu4e-up-to-date-status)
(global-set-key (kbd "C-c m r")  'mu4e-update-mail-and-index)
(define-key mu4e-main-mode-map (kbd "q") 'mu4e-quit-session)
(define-key mu4e-headers-mode-map (kbd "q") 'mu4e-quit-session)
(define-key mu4e-headers-mode-map (kbd "M-u") 'mu4e-update-mail-show-window)
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
;; (global-set-key [(ctrl z)]       'undo-tree-undo)
;; (global-set-key [(ctrl shift z)] 'undo-tree-redo)
;; (global-set-key (kbd "C-c z i")  'undo-tree-visualize)
(global-set-key [(ctrl shift z)]    'redo)

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
(key-chord-define-global "cf"    'find-file)
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
