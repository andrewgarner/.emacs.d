;;; surefire-js.el --- Emacs: JavaScript module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for JavaScript development.

;;; Code:

(require 'surefire-programming)

(surefire-require-packages '(js2-mode json-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun surefire-js2-mode-defaults ()
       "Default tweaks for `js2-mode'."

       (let ((map js2-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'surefire-toggle-hiding)))

       (setq js2-basic-offset 2)
       (setq mode-name "JS2")
       (setq tab-width 2)

       (js2-imenu-extras-mode +1)

       (surefire-prog-mode-defaults)

       (company-mode +1)
       (subword-mode +1)

       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

     (setq surefire-js2-mode-hook 'surefire-js2-mode-defaults)

     (add-hook 'js2-mode-hook (lambda ()
                               (run-hooks 'surefire-js2-mode-hook)))))

(provide 'surefire-js)
;;; surefire-js.el ends here
