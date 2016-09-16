;;; surefire-editor.el --- Emacs: Enhanced core editing experience.
;;
;; Copyright © 2016 SureFireThing Ltd
;;
;; Author: Andrew Garner <andrew@surefirething.co.uk>
;; URL: https://github.com/andrewgarner/.emacs.d

;;; Commentary:

;; Refinements of the core editing experience in Emacs.

;;; Code:

;; don’t use tabs to indent but maintain correct appearance
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)

;; newline at end of file
(setq require-final-newline t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; diminish keeps the modeline tidy
(surefire-require-package 'diminish)

;; visual line mode - wrap lines
(visual-line-mode t)
(diminish 'visual-line-mode)

;; show matching parentheses
(show-paren-mode t)

;; highlight current line globally
(global-hl-line-mode t)

;; add the ability to cut the current line, without marking it
(require 'rect)
(defadvice kill-region (before smart-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end) rectangle-mark-mode)
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; cursor
(if window-system
    (progn
      (blink-cursor-mode t)
      (setq initial-frame-alist
            (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
      (setq default-frame-alist
            (cons '(cursor-type . bar) (copy-alist default-frame-alist))))
  (blink-cursor-mode -1))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don’t muck with special buffers

;; saveplace remembers your location in a file when saving files
(surefire-require-package 'saveplace)
(setq save-place-file (expand-file-name "saveplace" surefire-savefile-dir))
;; activate it for all buffers
(setq-default save-place t)

;; savehist keeps track of some history
(surefire-require-package 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" surefire-savefile-dir))
(savehist-mode +1)

;; save recent files
(surefire-require-package 'recentf)
(setq recentf-save-file (expand-file-name "recentf" surefire-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never)

;; recentf
(surefire-require-package 'recentf)
(recentf-mode 1)
(setq recentf-save-file (expand-file-name "recentf" surefire-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 100
      ;; disable recentf-cleanup on Emacs start, because it can cause
      ;; problems with remote files
      recentf-auto-cleanup 'never
      recentf-exclude '("\\.git.*" "\\.hg.*" "\\.svn.*"))

(defun surefire-recentf-exclude-p (file)
  "A predicate to decide whether to exclude FILE from recentf."
  (let ((file-dir (file-truename (file-name-directory file))))
    (-any-p (lambda (dir)
              (string-prefix-p dir file-dir))
            (mapcar 'file-truename (list surefire-savefile-dir package-user-dir)))))

(add-to-list 'recentf-exclude 'surefire-recentf-exclude-p)

(recentf-mode +1)

;; use shift + arrow keys to switch between visible buffers
(surefire-require-package 'windmove)
(windmove-default-keybindings)

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun surefire-auto-save-command ()
  "Save the current buffer."
  (when (and buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands class &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.
The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command (,class ,(intern (concat (symbol-name command) "-" advice-name)) activate)
                    ,@body))
               commands)))

;; advise all window switching functions
(advise-commands "auto-save"
                 (switch-to-buffer other-window windmove-up windmove-down windmove-left windmove-right)
                 before
                 (surefire-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'surefire-auto-save-command)

(defadvice set-buffer-major-mode (after set-major-mode activate compile)
  "Set buffer major mode according to `auto-mode-alist'."
  (let* ((name (buffer-name buffer))
         (mode (assoc-default name auto-mode-alist 'string-match)))
    (with-current-buffer buffer (if mode (funcall mode)))))

;; display whitespace characters globally
(surefire-require-package 'whitespace)
(global-whitespace-mode t)
(diminish 'whitespace-mode)
(diminish 'global-whitespace-mode)
(setq whitespace-line-column 80) ;; limit line length

;; customize whitespace characters
;;  - Newline: \u00AC = ¬
;;  - Tab:     \u2192 = →
;;             \u00BB = »
;;             \u25B6 = ▶
(setq whitespace-display-mappings
      (quote ((newline-mark ?\n [?\u00AC ?\n] [?$ ?\n])
              (tab-mark     ?\t [?\u2192 ?\t] [?\u00BB ?\t] [?\\ ?\t]))))

(setq whitespace-style
      (quote (face tabs trailing space-before-tab newline
                   indentation space-after-tab tab-mark newline-mark
                   empty)))

;; flyspell setup
(require 'flyspell)
(diminish 'flyspell-mode)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

(defun surefire-cleanup-maybe ()
  "Invoke `whitespace-cleanup'."
  (whitespace-cleanup))

(defun surefire-enable-flyspell ()
  "Enable `flyspell-mode'."
    (flyspell-mode +1))

(defun surefire-enable-whitespace ()
  "Enable `whitespace-mode'."
  ;; keep the whitespace decent all the time (in this buffer)
  (add-hook 'before-save-hook 'surefire-cleanup-maybe nil t)
  (whitespace-mode +1))

(add-hook 'text-mode-hook 'surefire-enable-flyspell)
(add-hook 'text-mode-hook 'surefire-enable-whitespace)

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; bookmarks
(surefire-require-package 'bookmark)
(setq bookmark-default-file (expand-file-name "bookmarks" surefire-savefile-dir)
      bookmark-save-flag 1)

;; saner regex syntax
(surefire-require-package 're-builder)
(setq reb-re-syntax 'string)

;; shell for Emacs
(surefire-require-package 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" surefire-savefile-dir))

;; eliminate the need to re-parse unmodified files
(setq semanticdb-default-save-directory
      (expand-file-name "semanticdb" surefire-savefile-dir))

;; compilation from Emacs
(surefire-require-package 'compile)
(setq compilation-ask-about-save nil
      compilation-always-kill t
      compilation-scroll-output 'first-error)

(defun surefire-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

;; colorise output of Compilation Mode
(surefire-require-package 'ansi-color)
(add-hook 'compilation-filter-hook #'surefire-colorize-compilation-buffer)

;; sensible undo
(surefire-require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; enable winner-mode to manage window configurations
(winner-mode +1)

;; diff-hl
(surefire-require-package 'diff-hl)
(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; easy-kill
(surefire-require-package 'easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

(defadvice server-visit-files (before parse-numbers-in-lines (files proc &optional nowait) activate)
  "Open file with emacsclient with cursors positioned on requested line.
Most of console-based utilities prints filename in format
'filename:linenumber'.  So you may wish to open filename in that format.
Just call:
  emacsclient filename:linenumber
and file 'filename' will be opened and cursor set on line 'linenumber'"
  (ad-set-arg 0
              (mapcar (lambda (fn)
                        (let ((name (car fn)))
                          (if (string-match "^\\(.*?\\):\\([0-9]+\\)\\(?::\\([0-9]+\\)\\)?$" name)
                              (cons
                               (match-string 1 name)
                               (cons (string-to-number (match-string 2 name))
                                     (string-to-number (or (match-string 3 name) ""))))
                            fn))) files)))

(provide 'surefire-editor)
;;; surefire-editor.el ends here
