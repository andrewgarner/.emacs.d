;;; surefire-yaml.el --- Emacs: YAML module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for YAML.

;;; Code:

(require 'surefire-programming)
(surefire-require-package 'yaml-mode)

(defun surefire-yaml-mode-defaults ()
  (surefire-prog-mode-defaults)

  (setq tab-width 2)
  (setq whitespace-action (quote (auto-cleanup)))

  (subword-mode +1)

  (highlight-indentation-current-column-mode)
  (highlight-indentation-mode)
  (highlight-indentation-set-offset 2)

  (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))

(setq surefire-yaml-mode-hook 'surefire-yaml-mode-defaults)

(add-hook 'yaml-mode-hook (lambda ()
                          (run-hooks 'surefire-yaml-mode-hook)))

(provide 'surefire-yaml)
;;; surefire-yaml.el ends here
