;; general
(add-hook 'before-save-hook 'whitespace-cleanup)

;; css
(add-hook 'css-mode-hook
          '(lambda ()
             (rainbow-mode)))


(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (rainbow-delimiters-mode)))
;; ediff
;(add-hook 'ediff-mode-hook '(lambda ()
;                              (ediff-setup-keymap)
;                              (define-key ediff-mode-map "j" 'ediff-next-difference)
;                              (define-key ediff-mode-map "k" 'ediff-previous-difference)))

;; js2 mode
(add-hook 'js2-mode-hook
          '(lambda ()
             (indent-guide-mode)
             (rainbow-delimiters-mode)
             (fci-mode)))

;; markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode)))

;; mu4e
(add-hook 'mu4e-view-mode-hook
          '(lambda()
             (visual-line-mode)
             (text-scale-set +1)))

;; ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-end-mode)
             (ruby-tools-mode)
             (indent-guide-mode)
             (rainbow-delimiters-mode)
             ;; (add-to-list 'ac-ignores "end")
             ;; (make-local-variable 'ac-ignores)
             (fci-mode)
             ;; (flycheck-mode)
             (define-key ruby-mode-map (kbd "SPC") 'ruby-method-space-replace)
             ;; (rvm-activate-corresponding-ruby)
             ))


;; sql
(add-hook 'sql-mode-hook (lambda ()
                           (define-key sql-mode-map (kbd "RET") 'newline-and-indent)
                           (define-key sql-mode-map (kbd "C-q") 'sql-quit-session)
                           (define-key sql-interactive-mode-map (kbd "C-q") 'sql-quit-session)
                           (define-key sql-mode-map  [(ctrl f5)] 'sql-send-buffer-better)
                           (define-key sql-mode-map  [(ctrl f4)] 'sql-send-region-better)
                           (sql-set-product 'mysql)
                           (rainbow-delimiters-mode)
                           (auto-complete-mode)
                           (sql-highlight-mysql-keywords)))

;; text mode
(add-hook 'text-mode-hook (lambda ()
                            (turn-on-flyspell)
                            (visual-line-mode)))

;; web mode
(add-hook 'web-mode-hook
          '(lambda ()
             (rainbow-mode)
             (indent-guide-mode)
             (auto-complete-mode)))
