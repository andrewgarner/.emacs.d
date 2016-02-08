;;; surefire-ruby.el --- Emacs: SCSS module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for SCSS.

;;; Code:

(require 'surefire-css)
(surefire-require-package 'scss-mode)

;; turn off annoying auto-compile on save
(setq scss-compile-at-save nil)

(defun surefire-scss-mode-defaults ()
  (surefire-css-mode-defaults))

(setq surefire-scss-mode-hook 'surefire-scss-mode-defaults)

(add-hook 'scss-mode-hook (lambda () (run-hooks 'surefire-scss-mode-hook)))

(provide 'surefire-scss)
;;; surefire-scss.el ends here
