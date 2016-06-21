;;; surefire-smartparens.el --- Emacs: smartparens module.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Some basic configuration for smartparens.

;;; Code:

(surefire-require-packages '(diminish smartparens))

(require 'smartparens-config)

(setq sp-autoskip-closing-pair 'always)
(setq sp-base-key-bindings 'paredit)
(setq sp-hybrid-kill-entire-symbol nil)

(custom-set-faces
  '(sp-pair-overlay-face ((t (:inherit nil)))))

(sp-pair "{" nil :post-handlers
         '(((lambda (&rest _ignored)
              (surefire-smart-open-line-above)) "RET")))

(show-smartparens-global-mode +1)
(diminish 'smartparens-mode)

(defalias 'rw 'sp-rewrap-sexp)

(provide 'surefire-smartparens)
;;; surefire-smartparens.el ends here
