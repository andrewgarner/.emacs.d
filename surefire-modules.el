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
(require 'surefire-dired)
(require 'surefire-git)
(require 'surefire-helm)
(require 'surefire-linum)
(require 'surefire-linum-relative)
(require 'surefire-magit)
(require 'surefire-yasnippet)

;; project management
(require 'surefire-projectile)

;; workspace management

;; languages
(require 'surefire-coffee)
(require 'surefire-conf)
(require 'surefire-css)
(require 'surefire-cucumber)
(require 'surefire-dockerfile)
(require 'surefire-emacs-lisp)
(require 'surefire-go)
(require 'surefire-js)
(require 'surefire-json)
(require 'surefire-lisp)
(require 'surefire-markdown)
(require 'surefire-puppet)
(require 'surefire-ruby)
(require 'surefire-scss)
(require 'surefire-sh)
(require 'surefire-web)
(require 'surefire-yaml)

(provide 'surefire-modules)
;;; surefire-modules.el ends here
