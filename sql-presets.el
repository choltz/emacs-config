(defun sql-query(name)
  (interactive "SDatabase: ")
  (if (buffer-exists "*SQL* QUERY")
      (progn
        (window-configuration-to-register :before-sql)
        (jump-to-register :sql-fullscreen))
    (progn
      (window-configuration-to-register :before-sql)
      (switch-to-buffer "*SQL* QUERY")
      (delete-other-windows)
      (sql-mode)
      (sql-connect-preset name)
      (split-window-vertically)
      (switch-to-buffer "*SQL* QUERY")
      (window-configuration-to-register :mysql-fullscreen))))

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
           (flet ((sql-get-login (&rest what)))
             (sql-product-interactive sql-product)))))

;; Convenience functions - to bypass the db prompt
(defun mysql-tatango()
  (interactive)
  (sql-query 'tatango))

(defun auth-vader()
  (interactive)
  (sql-query 'auth-vader))

(defun webapp-vader()
  (interactive)
  (sql-query 'webapp-vader))

(defun sds-vader()
  (interactive)
  (sql-query 'sds-vader))

(defun auth-odin()
  (interactive)
  (sql-query 'auth-odin))

(defun webapp-odin()
  (interactive)
  (sql-query 'webapp-odin))

(defun webapp-odin-test()
  (interactive)
  (sql-query 'webapp-odin-test))

(defun sds-odin()
  (interactive)
  (sql-query 'sds-odin))

;; Restore previous window configuration
(defun sql-quit-session ()
  "Restores the previous window configuration"
  (interactive)
  (window-configuration-to-register :sql-fullscreen)
  (jump-to-register :before-sql))



;;
;; Position sql results on a new line so that the field headers are aligned
;; with the data below it.
;;
;; Taken from http://www.emacswiki.org/emacs/SqlMode and then modified
;; to play nice with emacs 24.4.
;;
(defvar sql-last-prompt-pos 1
  "position of last prompt when added recording started")
(make-variable-buffer-local 'sql-last-prompt-pos)
(put 'sql-last-prompt-pos 'permanent-local t)

(defun sql-add-newline-first (output)
  "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'
    This fixes up the display of queries sent to the inferior buffer
    programatically."
  (let ((begin-of-prompt
         (or
                  ;; sometimes this overlay is not on prompt
                  (save-excursion
                    (looking-at-p comint-prompt-regexp)
                    (point))
             1)))
    (if (> begin-of-prompt sql-last-prompt-pos)
        (progn
          (setq sql-last-prompt-pos begin-of-prompt)
          (concat "\n" output))
      output)))

(defun sqli-add-hooks ()
  "Add hooks to `sql-interactive-mode-hook'."
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)
