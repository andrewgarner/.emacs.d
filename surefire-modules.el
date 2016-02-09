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
(require 'surefire-linum)
(require 'surefire-linum-relative)
(require 'surefire-magit)

;; project management
(require 'surefire-projectile)

;; workspace management

;; languages
(require 'surefire-coffee)
(require 'surefire-css)
(require 'surefire-cucumber)
(require 'surefire-emacs-lisp)
(require 'surefire-go)
(require 'surefire-js)
(require 'surefire-json)
(require 'surefire-lisp)
(require 'surefire-markdown)
(require 'surefire-ruby)
(require 'surefire-scss)
(require 'surefire-sh)
(require 'surefire-yaml)

(provide 'surefire-modules)
;;; surefire-modules.el ends here
