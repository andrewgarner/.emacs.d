;;; surefire-web.el --- Emacs: Web template support.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Major mode for editing HTML templates.

;;; Code:

(require 'surefire-programming)

(surefire-require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-auto-pairing nil)

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
                 :unless '(sp-in-string-p)
                 :post-handlers '(((lambda (&rest _ignored)
                                     (just-one-space)
                                     (save-excursion (insert " ")))
                                   "SPC" "=" "#")))
  (sp-local-tag "#" "<%# " " %>")
  (sp-local-tag "%" "<% "  " %>")
  (sp-local-tag "=" "<%= " " %>"))

(eval-after-load 'web-mode
  '(progn
     (defun surefire-web-mode-defaults ()
       (setq tab-width 2
             web-mode-code-indent-offset 2
             web-mode-css-indent-offset 2
             web-mode-markup-indent-offset 2
             web-mode-sql-indent-offset 2)

       (company-mode +1)
       (hs-minor-mode 1)
       (subword-mode +1)

       (highlight-indentation-current-column-mode)
       (highlight-indentation-set-offset 2)

       (hideshowvis-enable)

       (let ((map web-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'surefire-toggle-hiding)))

     (setq surefire-web-mode-hook 'surefire-web-mode-defaults)

     (add-hook 'web-mode-hook (lambda ()
                                (run-hooks 'surefire-web-mode-hook)))))

(provide 'surefire-web)
;;; surefire-web.el ends here
