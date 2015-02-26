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
;; Shamelessly borrowed from
;; https://stackoverflow.com/questions/5541622/comint-mode-inserts-line-break-every-4096-characters
;;
;; Fixes sql output so it shows up on a new line. Without this the sql prompt
;; messes up the position of the sql field headers - misaligning them from their content
;;
(defun sql-add-newline-first (output)
  "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'"
  (remove-hook 'comint-preoutput-filter-functions
               'sql-add-newline-first)
  (concat "\n" output))

(defun sql-send-region-better (start end)
  "Send a region to the SQL process."
  (interactive "r")
      (save-excursion
        (add-hook 'comint-preoutput-filter-functions
                  'sql-add-newline-first)
        (comint-send-region sql-buffer start end)
        (if (string-match "\n$" (buffer-substring start end))
            ()
          (comint-send-string sql-buffer "\n"))
        (message "Sent string to buffer %s." (buffer-name sql-buffer))))

(defun sqli-add-hooks ()
  "Add hooks to `sql-interactive-mode-hook'."
  (add-hook 'comint-preoutput-filter-functions
            'sql-add-newline-first))

(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)
