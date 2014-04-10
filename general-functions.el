(defun find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun goto-line-and-center (line)
  "Goto the specified line and center the buffer"
  (interactive "nGoto Line:")
  (goto-line line)
  (recenter))

(defun occur-function-list()
  (interactive)
  (progn
    (electric-occur "def ")))
