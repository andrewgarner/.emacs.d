;;; surefire-coffee.el --- Emacs: CoffeeScript module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for CoffeeScript.

;;; Code:

(require 'surefire-programming)

(eval-after-load 'coffee-mode
  '(progn
     (surefire-require-package 'coffee-mode)

     (setq coffee-tab-width 2)

     ;; remove the "Generated by CoffeeScript" header
     (add-to-list 'coffee-args-compile "--no-header")

     (defun surefire-coffee-mode-defaults ()
       (surefire-prog-mode-defaults)

       ;; update the already compiled js on save
       (and (buffer-file-name)
            (file-exists-p (buffer-file-name))
            (file-exists-p (coffee-compiled-file-name (buffer-file-name)))
            (coffee-cos-mode t))

       (setq tab-width 2)

       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

       (subword-mode +1))

     (setq surefire-coffee-mode-hook 'surefire-coffee-mode-defaults)

     (add-hook 'coffee-mode-hook (lambda ()
                                   (run-hooks 'surefire-coffee-mode-hook)))))

(provide 'surefire-coffee)
;;; surefire-coffee.el ends here