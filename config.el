;;
;; DISPLAY SETTINGS
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode t)
(setq visible-bell t)
(global-linum-mode)
(global-hl-line-mode 1)
(column-number-mode)
(cua-mode t)
(ido-mode)
(recentf-mode)
(key-chord-mode 1)
(winner-mode)
(global-auto-revert-mode t)
(electric-pair-mode)
;;(global-rinari-mode) ; this should load for ruby files only
(ruby-tools-mode t)
(popwin-mode 1)
;; (global-auto-complete-mode t) ; only dev modes?
(scroll-bar-mode 0)
(save-place-mode)

(setq-default truncate-lines t)
(fset 'yes-or-no-p 'y-or-n-p) ; stop forcing me to spell out "yes"
(setq linum-format "%4d ")
(setq bs-must-always-show-regexp "\\*scratch\\*\\|*magit: scripts*\\|\\\*^.*")
(setq vc-follow-symlinks t)
(setq create-lockfiles nil)

;; Silence warning when processes are active
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  (flet ((process-list ())) ad-do-it))

;; fonts
(set-default-font "Ubuntu Mono-12")
(setq default-frame-alist '((font . "Ubuntu Mono-12")))

(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

; set the current horizontal line color and maintain syntax highlighting
(set-face-background 'hl-line "#2E3233")
(set-face-foreground 'highlight nil)

;;
;; BEHAVIOR SETINGS
;;

;; (golden-ratio-mode t)
;; miscellaneious behavior settings
(setq x-select-enable-clipboard t)
(setq select-enable-clipboard t)
(setq kill-do-not-save-duplicates t)
(setq delete-by-moving-to-trash t)
(setq tags-revert-without-query 1)
(setq inhibit-startup-message t)
(setq backup-directory-alist '(("." . "~/backup-source"))) ; stop leaving backup~ turds scattered everywhere
(setq apropos-do-all t)
(setq comint-input-ring-size 2048) ; undo size
(setq require-final-newline t)     ; end files with a newline
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
;; set default tab char's display width to 2 spaces
(setq-default tab-width 2)
(setq tab-width 2)

(add-to-list 'same-window-regexps "grep") ; make sure grep calls happen in the current window
(setq pop-up-windows nil)
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))) ;; don't let the cursor go into minibuffer prompt
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome")
;; (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "chromium-browser")

;; ag
(setq ag-reuse-window t)

;; autocomplete
;; (setq ac-comphist-file  "~/src/emacs-config/ac-comphist.dat")
;; (setq ac-use-quick-help t)
;; (setq ac-fuzzy-complete t)
;; (add-to-list 'ac-modes 'web-mode)

;; bm
(setq bm-highlight-style 'bm-highlight-only-line)

;; cua
(setq cua-keep-region-after-copy t)

;; css mode
(setq css-indent-offset 2)

;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)

;; dired
(setq dired-isearch-filenames t)
(toggle-diredp-find-file-reuse-dir 1)
(setq dired-listing-switches "-alh --group-directories-first")

;; ediff - don't spawn a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically))
;; elfeed
(setq elfeed-feeds
      '("http://feeds.gawker.com/io9/vip"
        "http://feeds.gawker.com/lifehacker/vip"
        "http://feeds.feedburner.com/HackerNewsFullFeed"
        "http://feeds2.feedburner.com/slashfilm"
        "https://www.geeksaresexy.net/feed/"
        "http://planet.emacsen.org/atom.xml"
        "http://www.computerworld.com/index.rss"
        "https://www.engadget.com/rss.xml"
        "http://feeds.gawker.com/gizmodo/full"
        "http://feeds.feedburner.com/TechCrunch/"))

(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-position (quote bottom))
(setq elfeed-goodies/powerline-default-separator nil)
(setq elfeed-goodies/tag-column-width 0)

;; elixir
(add-hook 'elixir-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(flycheck-credo-setup))
   (add-hook 'elixir-mode-hook 'flycheck-mode)

;; fill column mode
(setq fci-rule-column 100)
(setq fci-rule-color "#444444")
(setq fci-rule-use-dashes t)
(setq fci-dash-pattern .3)
(setq fci-always-use-textual-rule nil)

;; fiplr
(setq fiplr-ignored-globs '((directories (".git" ".svn" "tmp" "log"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

(setq highlight-indent-guides-method 'character)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-inhibit-characters-regexp ".") ; don't change directories
(setq ido-create-new-buffer 'always)
(setq ido-use-faces t)
(setq ido-use-virtual-buffers t)

;; indent guide mode
(setq indent-guide-recursive nil)

;; js2-mode
(setq js2-basic-offset 2)
(setq js2-cleanup-whitespace t)

;; js3-mode
(setq js3-basic-offset 2)
(setq js3-cleanup-whitespace t)
(setq js3-auto-indent-p t)
(setq js3-auto-insert-catch-block nil)
(setq js3-enter-indents-newline t)
(setq js3-indent-on-enter-key t)
(setq js3-strict-missing-semi-warning t)

;; magit settings
(setq magit-repo-dirs (quote ("~/src/tatango"
                              "~/src/deploy"
                              "~/src/albatross"
                              "~/src/messaging"
                              "~/scripts"
                              "~/docs"
                              "~/keys"
                              "~/src/cblog"
                              "~/emacs"
                              "~/src/mail_check"
                              "~/src/webapp"
                              "~/src/auth"
                              "~/src/sds"
                              "~/src/devtools"
                              "~/src/linux_scripts")))
(setq magit-repo-dirs-depth 1)
(setq magit-diff-options '("-w"))
(setq magit-status-buffer-switch-function 'switch-to-buffer) ; don't split the window
(setq magit-auto-revert-mode nil)

;; recentf
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
(run-at-time nil (* 5 60) 'recentf-save-list) ; save recent list every 5 mins, in case a crash wipes it out

;; ruby
(setq ruby-insert-encoding-magic-comment nil)

;; Scrolling and mouse
(setq redisplay-dont-pause t
      scroll-margin 15
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; save minibuffer history
(setq savehist-file (concat user-emacs-directory "savehist"))
(savehist-mode 1)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; scss
(setq scss-compile-at-save nil)

;; spell check
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

;; tramp
(setq tramp-default-method "ssh")

;; web-mode
(setq web-mode-enable-current-element-highlight nil)
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; yasnippet
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/src/emacs-config/snippets")))

;;
;; file type/mode associations
;;
(setq auto-mode-alist (cons '("\\Gemfile.lock" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$"       . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$"        . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$"        . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$"      . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rjs$"        . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$"         . js3-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$"       . scss-mode) auto-mode-alist))
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
