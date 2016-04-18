;;; surefire-ruby.el --- Emacs: Ruby module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for Ruby and Rails development.

;;; Code:

(require 'surefire-company)
(require 'surefire-programming)
(require 'surefire-rspec)
(require 'surefire-rubocop)

(surefire-require-packages '(bundler ruby-block ruby-hash-syntax ruby-tools inf-ruby yari))

(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

(define-key 'help-command (kbd "R") 'yari)

(eval-after-load 'ruby-mode
  '(progn
     (defun surefire-ruby-mode-defaults ()
       (setq c-tab-always-indent nil)
       (setq ruby-align-chained-calls t)
       (setq ruby-insert-encoding-magic-comment t)
       (setq ruby-use-smie t)
       (setq tab-width 2)

       (company-mode +1)
       (hs-minor-mode 1)
       (inf-ruby-minor-mode +1)
       (ruby-tools-mode +1)
       (subword-mode +1)

       (highlight-indentation-mode)
       (highlight-indentation-current-column-mode)

       (let ((map ruby-mode-map))
         (define-key map (kbd "C-j") 'newline-and-indent)
         (define-key map (kbd "RET") 'newline-and-indent)
         (define-key map (kbd "C-c C-h") 'surefire-toggle-hiding)
         (define-key map (kbd "C-c C-l") 'goto-line)))

     (setq surefire-ruby-mode-hook 'surefire-ruby-mode-defaults)

     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'surefire-ruby-mode-hook)))))

(provide 'surefire-ruby)
;;; surefire-ruby.el ends here
