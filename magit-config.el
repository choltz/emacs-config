;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :before-magit)
  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :before-magit))

;;
;; Monkey-patch vc-annotate to save the windows configuration to
;; a register first. then when closing the annotation window,
;; return the window configuration to its previous state
;;

(defadvice vc-annotate (before vc-annotate-preserve-windows)
  "Save the window configuration before calling vc-annotate"

  (define-key vc-annotate-mode-map  (kbd "q") (lambda()
                                                (interactive)
                                                (close-buffer)
                                                (pp "buh")
                                                (jump-to-register :before-annotate)))

  (window-configuration-to-register :before-annotate)
  (delete-other-windows))
(ad-activate 'vc-annotate)
