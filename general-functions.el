(defun buffer-exists (bufname)
  (some #'(lambda (b) (string-equal (buffer-name b) bufname))
        (buffer-list)))

(defun close-buffer()
  (interactive)
  (kill-buffer (buffer-name(current-buffer))))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun find-git-root(file-path)
  "recurse up the folder hierarchy to find the root of the git project"
  (if (equal file-path "")
      () ; drop out of recursion - nothing found
    (if (file-exists-p (concat file-path "/.git"))
        (prog1 file-path) ; drop out of recursion - git folder found
      (let ((new-path (replace-regexp-in-string "/[^$/]+$" "" file-path)))
        (find-git-root new-path)))))

(defun goto-line-and-center (line)
  "Goto the specified line and center the buffer"
  (interactive "nGoto Line:")
  (goto-line line)
  (recenter))

(defun occur-function-list()
  (interactive)
  (progn
    (electric-occur "def ")))
;;
;; Helm advice
;;
(defadvice helm-buffer-list(around helm-fullscreen activate)
  (window-configuration-to-register :before-helm)
  (define-key helm-map [(return)] 'helm-quit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun helm-quit-fullscreen()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (helm-exit-minibuffer)
  (jump-to-register :before-helm))
