;; ;; add everything inside site-lisp directory to load path
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
;; various libraries
(require 'noah_backup)

;; (require 'breadcrumb)
;; (require 'key-chord)
;; (key-chord-mode t)
;; (setq key-chord-two-keys-delay 0.5)
;; (require 'doxymacs)
;; (require 'highlight-symbol)
;;                                         ;(require 'browse-kill-ring)
;; (require 'highlight-parentheses)
(require 'ido)
(require 'sudo-save)

(require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
(require 'solarized)
(load-theme 'solarized-dark t)
;; (add-to-list 'default-frame-alist '(background-mode . dark))

;; Uniquify

(delete-selection-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; ;; (add-hook 'before-save-hook 'whitespace-cleanup)
;; (require 'expand-region)
;; (require 'yaml-mode)
(require 'buffer-move)
(require 'camelCase)
(require 'tidy)
(require 'sws-mode)
(require 'jade-mode)

;; the best whitespace managment I have found.
;; ethan-wspace only cleans up files you made
;; dirty yourself so no more messy diffs!
;; https://github.com/glasserc/ethan-wspace
(require 'ethan-wspace)

;; ;; (defun my-tabs-makefile-hook ()
;; ;;   (setq indent-tabs-mode t))
;; ;; (add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

;; ;; (defun my-tabs-makefile-hook ()
;; ;;   (local-set-key (kbd "<tab>") '(quote insert-tab)))
;; ;;   ;; (setq indent-tabs-mode t))
;; ;; (add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)


;; ;;;; enable a more powerful jump back function from ace jump mode
;; ;;

(require 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c C-u SPC") 'ace-jump-char-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; doxymacs
(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'doxymacs)
            (doxymacs-mode t)
            (doxymacs-font-lock)))

;; (require 'idomenu)
(require 'noah-autocomplete)

(load "noah/tabs.el")
(load "noah/shortcuts.el")
(load "noah/javascript.el")
(load "noah/markdown.el")
(load "noah/noah-ido.el")

(defalias 'yes-or-no-p 'y-or-n-p)
;; make scratch buffer empty by default
(setq initial-scratch-message nil)
;; put all backupfiles in 1 place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; (defun json-format ()
;;   (interactive)
;;   (save-excursion
;;     (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
;;     )
;;   )

;; (add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; scroll one line at a time (less "jumpy" than defaults)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed t) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time


;; ;; treat camelCase subwords as seperate
(setq camelCase-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq tramp-default-method "sshx")
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(defun rrename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


;;;;;;;;;;;;;;;;;;;;
;; visual stuff
;;;;;;;;;;;;;;;;;;;;
(setq solarized-contrast (quote low))
(scroll-bar-mode -1)
(setq show-paren-style (quote expression))
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(setq highlight-parentheses-mode t)

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(transient-mark-mode 1)
(setq inhibit-splash-screen t)
(column-number-mode 1)

(setq vc-follow-symlinks nil)
(setq c-basic-offset 2)
(setq c-default-style "k&r")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.


 '(c-hanging-braces-alist (quote ((block-close . c-snug-do-while) (statement-cont) (substatement-open after) (extern-lang-open after) (namespace-open after) (module-open after) (composition-open after) (inexpr-class-open after) (inexpr-class-close before) (arglist-cont-nonempty))))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-old-versions t)
 '(exec-path (quote ("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/X11/bin" "/Users/noah/bin")))
 '(hl-paren-colors (quote ("firebrick1" "" "" "")))
 '(ido-auto-merge-delay-time 0.3)
 '(kill-ring-max 5000))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "#81908f" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(helm-selection ((t (:background "midnight blue" :underline t))))
 '(hl-line ((t (:background "#E1E1B2"))) t)
 '(ido-only-match ((t (:background "#003946" :foreground "green" :weight bold)))))
