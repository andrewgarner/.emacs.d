;;; surefire-dired.el --- Emacs: dired module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for dired.

;;; Code:

(surefire-require-package 'dired+)

(defun surefire-dired-mode-defaults ()
  (define-key dired-mode-map (kbd "c") 'dired-create-directory)
  (linum-mode t)
  (toggle-diredp-find-file-reuse-dir 1))

(setq surefire-dired-mode-hook 'surefire-dired-mode-defaults)

(add-hook 'dired-mode-hook (lambda ()
                             (run-hooks 'surefire-dired-mode-hook)))

(provide 'surefire-dired)
;;; surefire-dired.el ends here
