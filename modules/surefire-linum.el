;;; surefire-linum.el --- Emacs: line numbers module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for line numbers.

;;; Code:

;; in gui mode the fringe is the spacer between line numbers and code, while in
;; console mode we add an extra space for it.
(if window-system
    (setq linum+-dynamic-format " %%%dd")
  (setq linum+-dynamic-format " %%%dd "))

(eval-after-load "linum+" '(progn (setq linum-format 'dynamic)))

(require 'linum+)

(provide 'surefire-linum)
;;; surefire-linum.el ends here
