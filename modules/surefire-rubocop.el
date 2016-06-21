;;; surefire-rubocop.el --- Emacs: Rubocop module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for Rubocop.

;;; Code:

(surefire-require-package 'rubocop)

(add-hook 'ruby-mode-hook 'rubocop-mode)

(provide 'surefire-rubocop)
;;; surefire-rubocop.el ends here
