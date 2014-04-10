(add-hook 'before-save-hook 'whitespace-cleanup)

;; jabber
(add-hook 'jabber-chat-mode-hook (lambda ()
                                   (visual-line-mode)
                                   (turn-on-flyspell)
                                   (text-scale-set -2)))

;; ruby
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-end-mode)
             ;; (add-to-list 'ac-ignores "end")
             ;; (make-local-variable 'ac-ignores)
             (fci-mode)
             (flycheck-mode)
             (rvm-activate-corresponding-ruby)))
