;;; surefire-markdown.el --- Emacs: Markdown module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for Markdown.

;;; Code:

(surefire-require-package 'markdown-mode)

(setq markdown-command "kramdown")

(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mkdn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(defun surefire-markdown-mode-defaults ()
  (setq whitespace-action nil)
  (setq fill-column 80)

  (auto-fill-mode)
  (fci-mode)
  (flyspell-mode)
  (linum-mode t)
  (subword-mode)

  (define-key markdown-mode-map (kbd "C-c p") 'markdown-preview))

(setq surefire-markdown-mode-hook 'surefire-markdown-mode-defaults)

(add-hook 'markdown-mode-hook (lambda ()
                                (run-hooks 'surefire-markdown-mode-hook)))

(provide 'surefire-markdown)
;;; surefire-markdown.el ends here
