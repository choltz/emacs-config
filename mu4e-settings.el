;;
;; Mailbox setup
;;
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")
(setq mu4e-refile-folder "/arcana")
(setq mu4e-attachment-dir "~/Downloads")

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.
(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
         ("/[Gmail].Sent Mail"   . ?s)
         ("/[Gmail].Trash"       . ?t)
         ("/[Gmail].All Mail"    . ?A)
         ("/arcana"              . ?r)
         ("/Company"             . ?c)
         ("/assembla"            . ?a)))

;; General settings
(setq mu4e-sent-messages-behavior 'delete) ; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq message-kill-buffer-on-exit t) ; don't keep message buffers around

;; Retrieve mail settings
(setq mu4e-get-mail-command nil) ; pull email via crontab script
(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 60)

;; Message display settings
(setq mu4e-view-prefer-html t)
(setq mu4e-html2text-command "w3m -dump -T text/html")
(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types) (imagemagick-register-types))
(add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)
(setq mu4e-headers-leave-behavior 'apply)

;; Smtp settings
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;;
;; Functions
;;

;; Save the window configuration and then open the inbox full screen
(defun mu4e-up-to-date-status ()
  (interactive)
  (window-configuration-to-register :mu4e-fullscreen)
  (mu4e-headers-search (concat "\"maildir:" "/INBOX" "\""))
  (delete-other-windows))

;; Restore previous window configuration
(defun mu4e-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :mu4e-fullscreen))
