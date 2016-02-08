;;; surefire-ruby.el --- Emacs: magit module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Some basic configuration for magit.

;;; Code:

(surefire-require-package 'magit)

(require 'surefire-fci)

(setq magit-bury-buffer-function 'magit-mode-quit-window)
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-default-tracking-name-function
      'magit-default-tracking-name-branch-only)
(setq magit-repository-directories
      (quote ("~/GitHub" "~/src" "~/.emacs.d" "~/.dotfiles")))
(setq magit-restore-window-configuration nil)
(setq magit-revert-buffers (quote silent))
(setq magit-status-buffer-switch-function 'switch-to-buffer)

(global-set-key (kbd "C-x g") 'magit-status)
(defalias 'bl 'magit-blame)

(defun surefire-magit-mode-defaults ())

(setq surefire-magit-mode-hook 'surefire-magit-mode-defaults)

(add-hook 'magit-mode-hook (lambda () (run-hooks 'surefire-magit-mode-hook)))

;; Configure git-commit-mode
(defun surefire-git-commit-mode-defaults ()
  (setq tab-width 2)

  (auto-fill-mode)
  (flyspell-mode)
  (linum-mode t)
  (subword-mode))

(setq surefire-git-commit-mode-hook 'surefire-git-commit-mode-defaults)

(add-hook 'git-commit-mode-hook (lambda ()
                                  (run-hooks 'surefire-git-commit-mode-hook)))

(provide 'surefire-magit)
;;; surefire-magit.el ends here
