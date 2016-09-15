;;; surefire-global-keybindings.el --- Emacs: Some useful keybindings.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Lots of useful keybindings.

;;; Code:

;; Allow hash to be entered
(defun insert-pound ()
  "Insert a pound into the buffer."
  (insert "#"))
(global-set-key (kbd "M-3") '(lambda()(interactive)(insert-pound)))

(provide 'surefire-global-keybindings)
;;; surefire-global-keybindings.el ends here
