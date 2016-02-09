;;; surefire-yasnippet.el --- Emacs: YASnippet module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for YASnippet.

;;; Code:

(surefire-require-packages '(diminish yasnippet))
(diminish 'yas-minor-mode)

(yas-global-mode 1)

(provide 'surefire-yasnippet)
;;; surefire-yasnippet.el ends here
