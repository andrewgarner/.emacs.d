;;; surefire-lisp.el --- Emacs: Lisp module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for lisp.

;;; Code:

(require 'surefire-programming)
(surefire-require-package 'rainbow-delimiters)

;; lisp configuration
(define-key read-expression-map (kbd "TAB") 'completion-at-point)

;; wrap keybindings
(define-key lisp-mode-shared-map (kbd "M-(") (surefire-wrap-with "("))
(define-key lisp-mode-shared-map (kbd "M-\"") (surefire-wrap-with "\""))

;; a great lisp coding hook
(defun surefire-lisp-coding-defaults ()
  (rainbow-delimiters-mode +1))
  (smartparens-strict-mode +1)

(setq surefire-lisp-coding-hook 'surefire-lisp-coding-defaults)

;; interactive modes don’t need whitespace checks
(defun surefire-interactive-lisp-coding-defaults ()
  (rainbow-delimiters-mode +1)
  (smartparens-strict-mode +1)
  (whitespace-mode -1))

(setq surefire-interactive-lisp-coding-hook
      'surefire-interactive-lisp-coding-defaults)

(provide 'surefire-lisp)

;;; surefire-lisp.el ends here
