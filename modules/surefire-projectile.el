;;; surefire-projectile.el --- Emacs: Projectile module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Basic configuration for Projectile.

;;; Code:

(surefire-require-package 'projectile)

(setq projectile-cache-file
      (expand-file-name  "projectile.cache" surefire-savefile-dir))

(setq projectile-completion-system 'ido)

(setq projectile-globally-ignored-directories
      (quote (".git")))

(setq projectile-globally-ignored-files
      (quote (".keep"
              "*.log"
              "TAGS")))

(setq projectile-sort-order 'recently-active)

(projectile-global-mode t)

(provide 'surefire-projectile)
;;; surefire-projectile.el ends here
