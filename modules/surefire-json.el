;;; surefire-json.el --- Emacs: JSON module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for JSON.

;;; Code:

(require 'surefire-programming)

(surefire-require-packages '(json-mode))

(defun surefire-json-mode-defaults ()
  "Default tweaks for `json-mode'."
  (surefire-prog-mode-defaults)

  (let ((indent-width 2))
    (setq js-indent-level indent-width)
    (setq json-reformat:indent-width indent-width)
    (setq tab-width indent-width)
    (highlight-indentation-set-offset indent-width))

  (company-mode +1)
  (subword-mode +1)

  (hs-minor-mode 1)

  (highlight-indentation-current-column-mode)
  (highlight-indentation-mode)

  (let ((map json-mode-map))
    (define-key map (kbd "C-j") 'newline-and-indent)
    (define-key map (kbd "C-c C-h") 'surefire-toggle-hiding)))

(setq surefire-json-mode-hook 'surefire-json-mode-defaults)

(add-hook 'json-mode-hook (lambda ()
                            (run-hooks 'surefire-json-mode-hook)))

(provide 'surefire-json)
;;; surefire-json.el ends here
