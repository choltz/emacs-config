;; general
(add-hook 'before-save-hook 'whitespace-cleanup)

;; css
(add-hook 'css-mode-hook
          '(lambda ()
             (rainbow-mode)))

;; jabber
(add-hook 'jabber-chat-mode-hook (lambda ()
                                   (visual-line-mode)
                                   (turn-on-flyspell)
                                   (text-scale-set -2)))
;; js2 mode
(add-hook 'js2-mode-hook
          '(lambda ()
             (fci-mode)))

;; markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode)))

;; ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-end-mode)
             (ruby-tools-mode)
             ;; (add-to-list 'ac-ignores "end")
             ;; (make-local-variable 'ac-ignores)
             (fci-mode)
             (flycheck-mode)
             ;; (rvm-activate-corresponding-ruby)
             ))

;; sql
(add-hook 'sql-mode-hook (lambda ()
                           (define-key sql-mode-map (kbd "RET") 'newline-and-indent)
                           (define-key sql-mode-map (kbd "C-q") 'sql-quit-session)
                           (define-key sql-interactive-mode-map (kbd "C-q") 'sql-quit-session)
                           (define-key sql-mode-map  [(ctrl f5)] 'sql-send-buffer)
                           (define-key sql-mode-map  [(ctrl f4)] 'sql-send-region)
                           (sql-set-product 'mysql)
                           (sql-highlight-mysql-keywords)))

;; text mode
(add-hook 'text-mode-hook (lambda ()
                            (turn-on-flyspell)
                            (visual-line-mode)))

;; web mode
(add-hook 'web-mode-hook
          '(lambda ()
             (rainbow-mode)
             (auto-complete-mode)))
