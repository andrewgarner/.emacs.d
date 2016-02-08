;;; surefire-programming.el --- Emacs: prog-mode configuration.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic prog-mode configuration and programming related utilities.

;;; Code:

(surefire-require-package 'guru-mode)

(require 'surefire-fci)
(require 'surefire-flycheck)
(require 'surefire-highlight-indentation)
(require 'surefire-highlight-symbol)
(require 'surefire-smartparens)

(defun surefire-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(defun surefire-font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;; enlist a more liberal guru
(setq guru-warn-only t)

(defun surefire-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (linum-mode t)
  (fci-mode)
  (flyspell-prog-mode)
  (guru-mode +1)
  (highlight-symbol-mode)
  (smartparens-mode +1)
  (setq whitespace-action (quote (auto-cleanup)))
  (surefire-local-comment-auto-fill)
  (surefire-font-lock-comment-annotations)
  (visual-line-mode +1)
  (whitespace-mode +1))

(setq surefire-prog-mode-hook 'surefire-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'surefire-prog-mode-hook)))

;; enable on-the-fly syntax checking
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))

(provide 'surefire-programming)
;;; surefire-projectile.el ends here
