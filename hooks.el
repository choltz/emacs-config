(add-hook 'before-save-hook 'whitespace-cleanup)

;; jabber
(add-hook 'jabber-chat-mode-hook (lambda ()
                                   (visual-line-mode)
                                   (turn-on-flyspell)
                                   (text-scale-set -2)))
