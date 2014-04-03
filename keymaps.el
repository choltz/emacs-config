;; Miscellaneous
(global-set-key [C-tab] 'mode-line-other-buffer)
(global-set-key [insert]         'nil)
(global-set-key [f4]             'bs-show)
(global-set-key (kbd "C-`")      'bs-show)


;; Magit
(global-set-key (kbd "C-c g")    'magit-status)
(global-set-key (kbd "C-c C-g")  'magit-status)

;; Smex
(global-set-key (kbd "M-X") 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-x") 'smex)

;; undo tree
(global-set-key   [(ctrl z)]       'undo-tree-undo)
(global-set-key   [(ctrl shift z)] 'undo-tree-redo)

; Key Chords
(key-chord-define-global "xf"    'find-file)
(key-chord-define-global "cg"   'magit-status)

;; (global-set-key "\M-[1;2C"    'right-char)      ; Ctrl+right   => forward word
;; (global-set-key "\M-[1;2D"    'backward-word)     ; Ctrl+left    => backward word

;;  (global-set-key "\M-[1;2C"    'buh)      ; Ctrl+right   => forward word

