;;; surefire-go.el --- Emacs: Go module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for Go.

;;; Code:

(require 'surefire-programming)

(setenv "GOPATH" (expand-file-name "~/.go"))

;; Ignore go test -c output files
(add-to-list 'completion-ignored-extensions ".test")

(define-key 'help-command (kbd "G") 'godoc)

(eval-after-load 'go-mode
  '(progn
     (surefire-require-packages
      '(go-mode company-go go-eldoc go-projectile gotest))

     (defun surefire-go-mode-defaults ()
       (surefire-prog-mode-defaults)

       ;; add to default go-mode key bindings
       (let ((map go-mode-map))
         (define-key map (kbd "RET") 'newline-and-indent)
         (define-key map (kbd "C-c a") 'go-test-current-project)
         (define-key map (kbd "C-c m") 'go-test-current-file)
         (define-key map (kbd "C-c .") 'go-test-current-test)
         (define-key map (kbd "C-c b") 'go-run)
         (define-key map (kbd "C-h f") 'godoc-at-point))

       ;; prefer goimports to gofmt if installed
       (let ((goimports (executable-find "goimports")))
         (when goimports
           (setq gofmt-command goimports)))

       ;; make tabs 4 spaces wide
       (setq tab-width 4)

       ;; gofmt on save
       (add-hook 'before-save-hook 'gofmt-before-save nil t)

       ;; enable company-mode
       (set (make-local-variable 'company-backends) '(company-go))
       (company-mode +1)

       ;; enable hide/show
       (hs-minor-mode 1)

       ;; CamelCase aware editing operations
       (subword-mode +1))

       ;; stop whitespace being highlighted
       (whitespace-toggle-options '(tabs))

     (setq surefire-go-mode-hook 'surefire-go-mode-defaults)

     (add-hook 'go-mode-hook (lambda ()
                               (run-hooks 'surefire-go-mode-hook)))))

(provide 'surefire-go)
;;; surefire-go.el ends here
