;;; surefire-packages.el --- Emacs: Default package selection.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; Takes care of the automatic installation of all the packages.

;;; Code:

(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-user-dir (expand-file-name "elpa" surefire-dir))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar surefire-packages
  '()
  "A list of packages to ensure are installed at launch.")

(defun surefire-packages-installed-p ()
  "Check if all packages in `surefire-packages' are installed."
  (every #'package-installed-p surefire-packages))

(defun surefire-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package surefire-packages)
    (add-to-list 'surefire-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun surefire-require-packages (packages)
  "Ensure PACKAGES are installed.  Missing packages are installed automatically."
  (mapc #'surefire-require-package packages))

(defun surefire-install-packages ()
  "Install all packages listed in `surefire-packages'."
  (unless (surefire-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database…")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (surefire-require-packages surefire-packages)))

;; run package installation
(surefire-install-packages)

(provide 'surefire-packages)
;;; surefire-packages.el ends here
