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
    (jabber-open-chat-window jabber-window1-username)
    (other-window 1)
    (jabber-open-chat-window jabber-window2-username)
    (other-window 1)
    (jabber-open-chat-window jabber-window3-username)
    (pop-to-buffer buffer)
))

;;
;; functions that define the libnotify jabber behavior
;;
(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-send (format "(PM) %s"
                             (jabber-jid-displayname (jabber-jid-user from)))
                     (format "%s: %s" (jabber-jid-resource from) text)))
    (notify-send (format "%s" (jabber-jid-displayname from))
                 text)))

;;
;; The emacs play-sound function causes a one second delay that freezes up all
;; other activity in the editor. This function works around the issue by playing
;; the sound file through a shell command instead.
;;
;; you'll need to sudo apt-get install sox, for this to work
;;
(defun jabber-play-sound-file-alt (soundfile)
  (start-process-shell-command "% beep" "% beep" (concat "play " soundfile)))

(setq jabber-alert-message-hooks (quote (jabber-message-wave jabber-message-echo jabber-message-scroll libnotify-jabber-notify)))

;; chat header line without the user's quote. This way I can put the chat in
;; in a narrow window on the side and still be able to see the user's typing status
(setq jabber-chat-header-line-format
      (quote
       (" "
        (:eval (jabber-jid-displayname jabber-chatting-with)) "	"
        (:eval (let ((buddy (jabber-jid-symbol jabber-chatting-with))) (propertize (or (cdr (assoc (get buddy (quote show)) jabber-presence-strings)) (get buddy (quote show))) (quote face) (or (cdr (assoc (get buddy (quote show)) jabber-presence-faces)) (quote jabber-roster-user-online))))) "	"
        "    " jabber-events-message "    " jabber-chatstates-message)))

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
    (pop-to-buffer buffer)))

;;
;; Prompts
;;
(setq jabber-chat-foreign-prompt-format "[%t] %n
")
(setq jabber-chat-local-prompt-format "[%t] %n
")
(setq jabber-muc-foreign-prompt-format "[%t] %n
")
(setq jabber-muc-local-prompt-format "[%t] %n
")
