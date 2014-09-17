;;
;; DISPLAY SETTINGS
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode t)
(setq visible-bell t)
(global-linum-mode)
(setq-default truncate-lines t)
(global-hl-line-mode 1)
(column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p) ; stop forcing me to spell out "yes"
(setq linum-format "%4d ")
(setq bs-must-always-show-regexp "\\*scratch\\*\\|*magit: scripts*\\|\\\*^.*")

;; Come back and clean this up; nested ifs are ugly
(if (string= system-name "gtmf")
  (progn
    (set-default-font "Ubuntu Mono-16")
    (setq default-frame-alist '((font . "Ubuntu Mono-16"))))
  (progn
    (if (string= system-name "vader")
      (progn
        (set-default-font "Ubuntu Mono-26")
        (setq default-frame-alist '((font . "Ubuntu Mono-26"))))
      (progn
        (set-default-font "Ubuntu Mono-12")
      (setq default-frame-alist '((font . "Ubuntu Mono-12")))))))


(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

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
(setq-default c-basic-offset 2)
;; set default tab char's display width to 2 spaces
(setq-default tab-width 2)
(setq tab-width 2)

(add-to-list 'same-window-regexps "grep") ; make sure grep calls happen in the current window
(setq pop-up-windows nil)
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))) ;; don't let the cursor go into minibuffer prompt
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome")
(ruby-tools-mode t)
(popwin-mode 1)

;; autocomplete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/source/emacs-config/autocomplete/dict")
(setq ac-comphist-file  "~/source/emacs-config/ac-comphist.dat")
(setq ac-use-quick-help t)
(setq ac-fuzzy-complete t)
(global-auto-complete-mode t)
;; (add-to-list 'ac-modes 'web-mode)
;; bm
(setq bm-highlight-style 'bm-highlight-only-line)
;; cua
(setq cua-keep-region-after-copy t)
;; css mode
(setq css-indent-offset 2)
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
(setq fci-rule-column 100)
(setq fci-rule-color "#444444")
(setq fci-rule-use-dashes t)
(setq fci-dash-pattern .3)
(setq fci-always-use-textual-rule nil)
;; ido
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-inhibit-characters-regexp ".") ; don't change directories
;; indent guide mode
(setq indent-guide-recursive nil)
;; jabber
(setq jabber-auto-reconnect t)
(setq jabber-alert-message-wave "/usr/share/sounds/purple/receive.wav")
(setq jabber-alert-muc-wave     "/usr/share/sounds/purple/receive.wav")
(setq jabber-play-sound-file (quote jabber-play-sound-file-alt))
(setq jabber-history-enabled t)
(setq jabber-use-global-history nil)
(setq jabber-history-size-limit 2048)
(setq jabber-history-dir        "/home/choltz/docs/emacs-jabber")
;; js2-mode
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)
;; magit settings
(setq magit-repo-dirs (quote ("~/source/tatango"
                              "~/source/deploy"
                              "~/source/albatross"
                              "~/source/messaging"
                              "~/scripts"
                              "~/docs"
                              "~/keys"
                              "~/source/cblog"
                              "~/emacs"
                              "~/source/mail_check"
                              "~/source/webapp"
                              "~/source/auth"
                              "~/source/sds"
                              "~/source/devtools"
                              "~/source/linux_scripts")))
(setq magit-repo-dirs-depth 1)
(setq magit-diff-options '("-w"))
(setq magit-status-buffer-switch-function 'switch-to-buffer) ; don't split the window
;; ruby
(global-rinari-mode)
(setq ruby-insert-encoding-magic-comment nil)
;; Scrolling and mouse
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; scss
(setq scss-compile-at-save nil)
;; spell check
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

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
(setq auto-mode-alist (cons '("\\.yml$"        . yaml-mode) auto-mode-alist))

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


(load "vendor/color-theme-railscasts.el")
(scroll-bar-mode 0)
