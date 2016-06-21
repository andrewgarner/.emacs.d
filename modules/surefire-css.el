;;; surefire-ruby.el --- Emacs: CSS module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for CSS.

;;; Code:

(require 'surefire-programming)

(eval-after-load 'css-mode
  '(progn
     (surefire-require-package 'rainbow-mode)

     (setq css-indent-offset 2)

     (defun surefire-css-mode-defaults ()
       (surefire-prog-mode-defaults)

       (setq tab-width 2)

       (rainbow-mode +1)

       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

       (run-hooks 'surefire-prog-mode-hook))

     (setq surefire-css-mode-hook 'surefire-css-mode-defaults)

     (add-hook 'css-mode-hook (lambda ()
                                (run-hooks 'surefire-css-mode-hook)))))

(provide 'surefire-css)
;;; surefire-css.el ends here
