;;; init.el --- Emacs configuration entry point.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/surefire/.emacs.d

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules needed.

;;; Code:

(defvar surefire-dir (file-name-directory load-file-name)
  "The root dir of the Emacs configuration.")

(defvar surefire-core-dir (expand-file-name "core" surefire-dir)
  "The home of core functionality.")

(defvar surefire-modules-dir (expand-file-name "modules" surefire-dir)
  "This directory houses all of the modules.")

(defvar surefire-themes-dir (expand-file-name "themes" surefire-dir)
  "This directory houses all of the themes.")

(defvar surefire-vendor-dir (expand-file-name "vendor" surefire-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")

(defvar surefire-savefile-dir (expand-file-name "savefile" surefire-dir)
  "This folder stores all the automatically generated save/history-files.")

(defvar surefire-modules-file (expand-file-name "surefire-modules.el" surefire-dir)
  "This files contains a list of modules that will be loaded.")

(unless (file-exists-p surefire-savefile-dir)
  (make-directory surefire-savefile-dir))

(defun surefire-add-subfolders-to-load-path (parent-dir)
 "Add all level PARENT-DIR subdirs to the `load-path'."
 (dolist (f (directory-files parent-dir))
   (let ((name (expand-file-name f parent-dir)))
     (when (and (file-directory-p name)
                (not (string-prefix-p "." f)))
       (add-to-list 'load-path name)
       (surefire-add-subfolders-to-load-path name)))))

;; add directories to Emacs's `load-path'
(add-to-list 'load-path surefire-core-dir)
(add-to-list 'load-path surefire-modules-dir)
(add-to-list 'load-path surefire-themes-dir)
(add-to-list 'load-path surefire-vendor-dir)
(surefire-add-subfolders-to-load-path surefire-vendor-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; the core stuff
(message "Loading core...")
(require 'surefire-packages)
(require 'surefire-core)
(require 'surefire-ui)
(require 'surefire-editor)
(require 'surefire-global-keybindings)

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'surefire-osx))

;; the modules
(message "Loading modules...")
(require 'surefire-modules)

;;; init.el ends here
