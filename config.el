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
(setq linum-format "%4d ")
(setq bs-must-always-show-regexp "\\*scratch\\*\\|*magit: scripts*\\|\\\*^.*")

;;
;; BEHAVIOR SETINGS
;;

;; enable modes
(cua-mode t)
(ido-mode)
(global-undo-tree-mode)
(recentf-mode)
(key-chord-mode 1)
(desktop-save-mode 1)
(winner-mode)
;; miscellaneious behavior settings
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
(setq comint-input-ring-size 2048) ; undo size
(setq require-final-newline t)     ; end files with a newline
(electric-pair-mode)
(setq-default indent-tabs-mode nil)
(add-to-list 'same-window-regexps "grep") ; make sure grep calls happen in the current window
(setq pop-up-windows nil)
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))) ;; don't let the cursor go into minibuffer prompt

;; autocomplete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/source/emacs-config/autocomplete/dict")
(setq ac-comphist-file  "~/source/emacs-config/ac-comphist.dat")
(setq ac-use-quick-help t)
(setq ac-fuzzy-complete t)
(global-auto-complete-mode t)
;; (add-to-list 'ac-modes 'web-mode)
;; bm
(setq bm-highlight-style 'bm-highlight-only-fringe)
;; cua
(setq cua-keep-region-after-copy t)
;; dired
(setq dired-isearch-filenames t)
(toggle-diredp-find-file-reuse-dir 1)
(setq dired-listing-switches "-alh --group-directories-first")
;; ediff - don't spawn a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically))
;; fill column mode
(setq fci-rule-color "#444444")
(setq fci-rule-use-dashes t)
(setq fci-dash-pattern .3)
(setq fci-always-use-textual-rule nil)
;; ido
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-inhibit-characters-regexp ".") ; don't change directories
;; js2-mode
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
;; magit settings
(setq magit-repo-dirs (quote ("~/source/tatango" "~/source/deploy" "~/source/albatross" "~/source/messaging" "~/scripts" "~/docs" "~/keys" "~/source/cblog" "~/emacs" "~/source/mail_check")))
(setq magit-repo-dirs-depth 1)
(setq magit-diff-options '("-w"))
(setq magit-status-buffer-switch-function 'switch-to-buffer) ; don't split the window
;; ruby
(setq ruby-insert-encoding-magic-comment nil)
;; Scrolling and mouse
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; SCSS: Don't compile when saving
(setq scss-compile-at-save nil)
;; spell check
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))



;;
;; DISPLAY FONTS AND FACES
;;

(set-default-font "Ubuntu Mono-12")
(setq default-frame-alist '((font . "Ubuntu Mono-12")))
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
;; smart mode line
(setq sml/override-theme t)
(setq sml/active-background-color "#444444")
(setq sml/inactive-background-color "#222222")
(set-face-attribute 'sml/filename nil :foreground "#CDBE64")

;;
;; file type/mode associations
;;
(setq auto-mode-alist (cons '("\\Gemfile.lock" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$"       . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$"        . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$"        . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$"      . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rjs$"        . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$"         . js2-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$"       . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yml$"       . yaml-mode) auto-mode-alist))

;;
;; Complex behaviors
;;

;; indent pasted code
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))
