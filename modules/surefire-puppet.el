;;; surefire-puppet.el --- Emacs: puppet module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://puppethub.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for Puppet.

;;; Code:

(require 'surefire-programming)
(surefire-require-packages '(flymake-easy flymake-puppet puppet-mode))

(defun surefire-puppet-mode-defaults ()
  (surefire-prog-mode-defaults)

  (flymake-puppet-load))

(setq surefire-puppet-mode-hook 'surefire-puppet-mode-defaults)

(add-hook 'puppet-mode-hook (lambda ()
                          (run-hooks 'surefire-puppet-mode-hook)))

(provide 'surefire-puppet)
;;; surefire-puppet.el ends here
