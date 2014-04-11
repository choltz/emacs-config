(defun search-content()
  (interactive)
  (window-configuration-to-register :before-search)
  (progn
    (let ((value (read-from-minibuffer "Search Content:"))
          (project-folder (find-git-root (buffer-file-name(current-buffer)))  ))
      (ack  (concat "ack-grep '" value "' " project-folder "/* -i --column --nogroup")))

    ;; Pop to the ack buffer, then change it's name
    (pop-to-buffer "*ack*")
    (if (not (equal nil (get-buffer "*^ SEARCH RESULTS"))) ; kill the old search buffer
      (kill-buffer "*^ SEARCH RESULTS"))
    (rename-buffer "*^ SEARCH RESULTS")

    (pop-to-buffer "*^ SEARCH RESULTS")
    (delete-other-windows)

    (define-key ack-mode-map  [(return)] 'search-content-select-item)
    (define-key ack-mode-map  [(escape)] 'search-content-cancel)
    (define-key ack-mode-map  (kbd "C-q") 'search-content-cancel)
    (define-key ack-mode-map  (kbd "q") 'search-content-cancel)))

(defun search-content-select-item()
  (interactive)
  (let ((value (ffap-string-at-point)))
    (progn
      (jump-to-register :before-search)
      (find-file (replace-regexp-in-string ":[^:]*" "" value))
      (goto-line (string-to-number (replace-regexp-in-string "^[^:]*:" "" value))))))

(defun search-content-cancel()
  (interactive)
  (jump-to-register :before-search))


;; (define-derived-mode search-content-mode
;;   grep-mode "Search Content"
;;   "Major mode for recursive searches through a folder.
;; \\{search-content-mode-map}"
;;
;;   (defun search-content-mode-select-item()
;;     (interactive)
;;     (let ((value (ffap-string-at-point)))
;;       (progn
;;         (find-file (replace-regexp-in-string ":[^:]*" "" value))
;;         (goto-line (string-to-number (replace-regexp-in-string "^[^:]*:" "" value))))))
;;
;;   (defun search-content-mode-cancel()
;;     (interactive)
;;     (kill-buffer "*^ SEARCH RESULTS")
;;     (delete-window)))
;;
;; (defun search-content()
;;   (interactive)
;;   (progn
;;     (let ((value (read-from-minibuffer "Search Content:"))
;;           (project-folder (rinari-root)))
;;                                         ; (ack  (concat "ack-grep '" value "' " project-folder "/* -i --column --nogroup")))
;;       (ag-project value))
;;     (delete-window)
;;     (search-content-mode)
;;     (rename-buffer "*^ SEARCH RESULTS")))
;;
;; (define-key search-content-mode-map  [(return)] 'search-content-mode-select-item)
;; (define-key search-content-mode-map  [(escape)] 'search-content-mode-cancel)
