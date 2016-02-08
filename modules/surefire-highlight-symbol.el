;;; surefire-highlight-symbol.el --- Emacs: highlight-symbol module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for highlight-symbol.

;;; Code:

(surefire-require-package 'highlight-symbol)

(setq highlight-symbol-highlight-single-occurrence 'nil)
(setq highlight-symbol-idle-delay 0.5)

(global-set-key (kbd "C-c C-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c C-n") 'highlight-symbol-next)

(provide 'surefire-highlight-symbol)
;;; surefire-highlight-symbol.el ends here
