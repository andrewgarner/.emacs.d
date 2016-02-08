;;; surefire-flycheck.el --- Emacs: Flycheck module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; On the fly syntax checking.

;;; Code:

(surefire-require-package 'flycheck)

(setq flycheck-completion-system 'ido)
(setq flycheck-idle-change-delay 1.0)
(setq flycheck-indication-mode 'right-fringe)

(provide 'surefire-flycheck)
;;; surefire-projectile.el ends here
