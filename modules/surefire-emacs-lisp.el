;;; surefire-emacs-lisp.el --- Emacs: Emacs Lisp module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for Emacs lisp.

;;; Code:

(require 'surefire-lisp)

(surefire-require-packages '(diminish elisp-slime-nav rainbow-mode))

(defun surefire-recompile-elc-on-save ()
  "Recompile your elc when saving an elisp file."
  (add-hook 'after-save-hook
            (lambda ()
              (when (and
                     (string-prefix-p surefire-dir (file-truename buffer-file-name))
                     (file-exists-p (byte-compile-dest-file buffer-file-name)))
                (emacs-lisp-byte-compile)))
            nil
            t))

(defun surefire-visit-ielm ()
  "Switch to default `ielm' buffer.
Start `ielm' if it's not already running."
  (interactive)
  (surefire-start-or-switch-to 'ielm "*ielm*"))

(define-key emacs-lisp-mode-map (kbd "C-c C-z") 'surefire-visit-ielm)
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)

(defun surefire-conditional-emacs-lisp-checker ()
  "Don’t check doc style in Emacs Lisp test files."
  (let ((file-name (buffer-file-name)))
    (when (and file-name (string-match-p ".*-tests?\\.el\\'" file-name))
      (setq-local flycheck-checkers '(emacs-lisp)))))

(defun surefire-emacs-lisp-mode-defaults ()
  "Sensible defaults for `emacs-lisp-mode'."
  (run-hooks 'surefire-lisp-coding-hook)
  (eldoc-mode +1)
  (surefire-recompile-elc-on-save)
  (rainbow-mode +1)
  (setq mode-name "EL")
  (surefire-conditional-emacs-lisp-checker))

(setq surefire-emacs-lisp-mode-hook 'surefire-emacs-lisp-mode-defaults)

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (run-hooks 'surefire-emacs-lisp-mode-hook)))

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))

;; ielm is an interactive Emacs Lisp shell
(defun surefire-ielm-mode-defaults ()
  "Sensible defaults for `ielm'."
  (run-hooks 'surefire-interactive-lisp-coding-hook)
  (eldoc-mode +1))

(setq surefire-ielm-mode-hook 'surefire-ielm-mode-defaults)

(add-hook 'ielm-mode-hook (lambda ()
                            (run-hooks 'surefire-ielm-mode-hook)))

(eval-after-load "elisp-slime-nav"
  '(diminish 'elisp-slime-nav-mode))
(eval-after-load "rainbow-mode"
  '(diminish 'rainbow-mode))
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))

(eval-after-load "ielm"
  '(progn
     (define-key ielm-map (kbd "M-(") (surefire-wrap-with "("))
     (define-key ielm-map (kbd "M-\"") (surefire-wrap-with "\""))))

;; enable elisp-slime-nav-mode
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))

(defun conditionally-enable-smartparens-mode ()
  "Enable `smartparens-mode' in the minibuffer, during `eval-expression'."
  (if (eq this-command 'eval-expression)
      (smartparens-mode 1)))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-smartparens-mode)

(provide 'surefire-emacs-lisp)
;;; surefire-emacs-lisp.el ends here
