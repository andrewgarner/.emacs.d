;;; surefire-fci.el --- Emacs: fill-column-indicator module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for fill-column-indicator.

;;; Code:

(surefire-require-package 'fill-column-indicator)

(setq fci-rule-width 1
      fci-handle-trucate-lines nil)

(provide 'surefire-fci)
;;; surefire-fci.el ends here
