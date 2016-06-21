;;; surefire-sh.el --- Emacs: Shell script module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for shell scripts.

;;; Code:

(require 'surefire-programming)

(defun surefire-sh-mode-defaults ()
  (surefire-prog-mode-defaults)

  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (setq tab-width 2)
  (setq whitespace-action (quote (auto-cleanup)))

  (highlight-indentation-current-column-mode)
  (highlight-indentation-mode)
  (highlight-indentation-set-offset 2)

  (subword-mode +1)

  (define-key sh-mode-map (kbd "RET") 'newline-and-indent))

(setq surefire-sh-mode-hook 'surefire-sh-mode-defaults)

(add-hook 'sh-mode-hook (lambda ()
                          (run-hooks 'surefire-sh-mode-hook)))

(provide 'surefire-sh)
;;; surefire-sh.el ends here
