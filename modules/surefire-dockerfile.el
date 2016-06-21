;;; surefire-dockerfile.el --- Emacs: Dockerfile module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Major mode for editing Docker’s Dockerfiles.

;;; Code:

(require 'surefire-programming)

(surefire-require-package 'dockerfile-mode)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(eval-after-load 'dockerfile-mode
  '(progn
     (defun surefire-dockerfile-mode-defaults ()
       (surefire-prog-mode-defaults)
       (subword-mode +1))

     (setq surefire-dockerfile-mode-hook 'surefire-dockerfile-mode-defaults)

     (add-hook 'dockerfile-mode-hook (lambda ()
                                       (run-hooks 'surefire-dockerfile-mode-hook)))))

(provide 'surefire-dockerfile)
;;; surefire-dockerfile.el ends here
