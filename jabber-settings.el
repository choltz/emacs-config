(setq jabber-auto-reconnect t)


;; Open a chat window to the user specified
(defun jabber-open-chat-window (jid)
  (interactive)
  (jabber-chat-with (jabber-find-active-connection (jabber-find-connection "choltz@gmail.com")) jid))

;; Set up windows to put chat windows to the right
(defun configure-chat-windows()
  (interactive)
  (let ((buffer (current-buffer)))
    ;; set up windows
    (delete-other-windows)
    (split-window-horizontally -40)
    (other-window 1)
    (split-window-vertically)
    (enlarge-window (/ (window-height (next-window)) 3))
    (split-window-vertically)
    ;; open chats
    (jabber-open-chat-window "boowebb@gmail.com")
    (other-window 1)
    (jabber-open-chat-window "jeremy.day@gmail.com")
    (other-window 1)
    (jabber-open-chat-window "vasilina.mulyavina@gmail.com")
    (pop-to-buffer buffer)
))
