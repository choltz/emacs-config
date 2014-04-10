(define-derived-mode electric-occur-mode
  occur-mode "Electric Occur"
  "Major mode for Electic Occur Behavior.
\\{electric-occur-mode-map}"

  (defun electric-occur-mode-select-item()
    (interactive)
    (progn
      (occur-mode-display-occurrence)
      (kill-buffer "*occur*")
      (next-buffer)
      ;(delete-other-windows)
      (delete-window)
    )
  )

  (defun electric-occur-mode-cancel()
    (interactive)
    (kill-buffer "*Occur*")
    ;(delete-other-windows)
    (delete-window)
    ;(next-buffer)
  )
)

(defun electric-occur(text)
  (interactive)
  ;(occur text)
  ;(occur-1 text nlines bufs &optional buf-name)
  (occur-1 text nil (list (current-buffer)) "*occur*")
  (pop-to-buffer "*occur*")
  (electric-occur-mode)
)

(define-key electric-occur-mode-map
  [(return)] 'electric-occur-mode-select-item)

(define-key electric-occur-mode-map
  [(escape)] 'electric-occur-mode-cancel)
