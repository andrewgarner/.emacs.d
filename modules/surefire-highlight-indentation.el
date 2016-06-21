;;; surefire-highlight-indentation.el --- Emacs: highlight-indentation module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for highlight-indentation.

;;; Code:

(surefire-require-packages '(diminish highlight-indentation))

(diminish 'highlight-indentation-mode)
(diminish 'highlight-indentation-current-column-mode)

(provide 'surefire-highlight-indentation)
;;; surefire-highlight-indentation.el ends here
