;;; surefire-conf.el --- Emacs: Conf module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Major mode for editing conf/ini/properties files.

;;; Code:

(require 'surefire-programming)

(surefire-require-package 'conf-mode)

(add-to-list 'auto-mode-alist '("Procfile\\'" . conf-mode))

(eval-after-load 'conf-mode
  '(progn
     (defun surefire-conf-mode-defaults ()
       (surefire-prog-mode-defaults)

       (setq tab-width 2)

       (highlight-indentation-set-offset 2)
       (highlight-indentation-current-column-mode))

     (setq surefire-conf-mode-hook 'surefire-conf-mode-defaults)

     (add-hook 'conf-mode-hook (lambda ()
                                 (run-hooks 'surefire-conf-mode-hook)))))

(provide 'surefire-conf)
;;; surefire-conf.el ends here
