;;; surefire-cucumber.el --- Emacs: Cucumber module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for Cucumber.

;;; Code:

(require 'surefire-programming)
(surefire-require-package 'feature-mode)

(defun surefire-feature-mode-defaults ()
  (surefire-prog-mode-defaults)

  (setq highlight-indentation-offset 2)
  (setq tab-width 2)

  (highlight-indentation-current-column-mode)
  (highlight-indentation-mode))

(setq surefire-feature-mode-hook 'surefire-feature-mode-defaults)

(add-hook 'feature-mode-hook (lambda ()
                               (run-hooks 'surefire-feature-mode-hook)))

(provide 'surefire-cucumber)
;;; surefire-cucumber.el ends here
