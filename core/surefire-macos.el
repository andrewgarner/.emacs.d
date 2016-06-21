;;; surefire-macos.el --- Emacs: macOS specific settings.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some macOS specific stuff.

;;; Code:

(when (memq window-system '(ns mac))

  ;; use zenburn as the default theme
  (surefire-require-package 'zenburn-theme)
  (require 'zenburn-theme)

  ;; set default font
  (set-default-font "SF Mono 14")

  ;; enable emoji font as fallback
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)

  ;; set modifier keys
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq ns-alternate-modifier 'meta)
  (setq ns-command-modifier 'super)
  (setq ns-function-modifier 'hyper)

  ;; hide the menu bar
  (setq ns-auto-hide-menu-bar nil)

  ;; disable native fullscreen
  (setq ns-use-native-fullscreen nil)

  ;; ensure environment variables inside Emacs look the same as the shell
  (surefire-require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(provide 'surefire-macos)
;;; surefire-macos.el ends here
