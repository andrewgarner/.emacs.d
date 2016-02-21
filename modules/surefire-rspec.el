;;; surefire-rspec.el --- Emacs: RSpec module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for RSpec testing.

;;; Code:

(surefire-require-package 'rspec-mode)

(eval-after-load 'rspec-mode
  '(progn
     (defun surefire-rspec-mode-defaults ()
       '(rspec-install-snippets))

     (setq surefire-rspec-mode-hook 'surefire-rspec-mode-defaults)

     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'surefire-rspec-mode-hook)))))

(provide 'surefire-rspec)
;;; surefire-rspec.el ends here
