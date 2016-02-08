;;; surefire-modules.el --- Emacs: Module loading.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules needed.

;;; Code:

;; modules

;; project management
(require 'surefire-projectile)

;; workspace management

;; languages

(provide 'surefire-modules)
;;; surefire-modules.el ends here
