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

(defun psql-tatango()
  (interactive)
  (sql-query 'tatango-psql))

;; Restore previous window configuration
(defun sql-quit-session ()
  "Restores the previous window configuration"
  (interactive)
  (window-configuration-to-register :sql-fullscreen)
  (jump-to-register :before-sql))
