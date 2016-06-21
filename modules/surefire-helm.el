;;; surefire-helm.el --- Emacs: HELM module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Incremental completion and selection narrowing.

;;; Code:

(surefire-require-packages '(helm helm-projectile))

(require 'helm-config)
(require 'helm-projectile)

(provide 'surefire-helm)
;;; surefire-helm.el ends here
