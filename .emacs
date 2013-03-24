;; add everything inside site-lisp directory to load path
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
;; various libraries
;;(require 'noah_backup)

(require 'breadcrumb)
(require 'key-chord)
(key-chord-mode t)
(setq key-chord-two-keys-delay 0.5)
(require 'doxymacs)
(require 'highlight-symbol)
                                        ;(require 'browse-kill-ring)
(require 'highlight-parentheses)
(require 'ido)
(require 'sudo-save)

;; (require 'color-theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")
;; (require 'solarized)
(load-theme 'solarized-dark t)
(add-to-list 'default-frame-alist '(background-mode . dark))

;; Uniquify

(delete-selection-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; (load-file "~/.emacs.d/site-lisp/noah/color-theme-twilight-noah.el")
;; (load-file "~/.emacs.d/site-lisp/noah/color-theme-ps-warm.el")

(add-hook 'before-save-hook 'whitespace-cleanup)
(require 'expand-region)
(require 'apache-mode)
(require 'cuda-mode)
(require 'yaml-mode)
(require 'multi-term)
(require 'buffer-move)
(require 'camelCase)
(require 'tidy)
(require 'geben)
(require 'sws-mode)
(require 'jade-mode)

(defun my-tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

;; (defun my-tabs-makefile-hook ()
;;   (local-set-key (kbd "<tab>") '(quote insert-tab)))
;;   ;; (setq indent-tabs-mode t))
;; (add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

(require 'markdown-mode)
;;;; enable a more powerful jump back function from ace jump mode
;;

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


;; (autoload 'markdown-mode "markdown-model.el"
;;   "Major mode for editing files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; (require 'el-get)
;; doxymacs
(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'doxymacs)
            (doxymacs-mode t)
            (doxymacs-font-lock)))

(require 'idomenu)
(require 'noah-autocomplete)
(setq-default ac-sources '(ac-source-yasnippet))
(defun my-ac-emacs-lisp-mode ()
  (setq ac-sources '(ac-source-symbols ac-source-functions ac-source-filename ac-source-words-in-same-mode-buffers)))
(add-hook 'emacs-lisp-mode-hook 'my-ac-emacs-lisp-mode)

(load "noah/tabs.el")
(load "noah/shortcuts.el")
(load "noah/javascript.el")

;; make scratch buffer empty by default
(setq initial-scratch-message nil)
;; put all backupfiles in 1 place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; put all autosave files in the system temp directory e.g. 'C:\temp' or '/tmp'

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Always delete trailing whitespace
;; (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))


;; kill minibuffer command when switching windows with the mouse
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(defun stop-using-minibuffer-and-other-window ()
  (interactive)
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit))
  (other-window 1)
  )



(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scroll one line at a time (less "jumpy" than defaults)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed t) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; treat camelCase subwords as seperate
(camelCase-mode 1)
(autoload 'camelCase-mode "camelCase/camelCase-mode")
(add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))
(add-hook 'find-file-hook '(lambda () (camelCase-mode 1)))
(add-hook 'php-mode-hook '(lambda () (camelCase-mode 1)))
(add-hook 'python-mode-hook '(lambda () (camelCase-mode 1)))

(add-hook 'js2-mode-hook '(lambda () (camelCase-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C# setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'csharp-mode-hook
          '(lambda ()
             (c-set-style k&r))
          )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PHP setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(autoload 'php-imenu-create-index "php-imenu" nil t)
(add-hook 'php-mode-hook 'imenu-add-menubar-index)
(add-hook 'php-mode-hook 'camelCase-mode t)
                                        ;(add-hook 'php-mode-hook 'camelCase-mode)
(setq c-basic-offset 2)
;; Load the php-imenu index function
(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
;; In php-mode 1.2, it's php-mode-user-hook.  In 1.4, it's php-mode-hook.
(add-hook 'php-mode-user-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  ;;(setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq tramp-default-method "sshx")
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ido-everywhere t)
(ido-mode t)
(setq ido-enable-flex-matching t)
(defun noah-ido-config()
  ;; ... other ido-config here ...
  ;; disable auto searching for files unless called explicitly with C-c C-s
  ;; (setq ido-auto-merge-delay-time 99999)
  ;; (define-key ido-file-dir-completion-map (kbd "C-c C-s")
  ;;   (lambda()
  ;;     (interactive)
  ;;     (ido-initiate-auto-merge (current-buffer)))))
  (add-hook 'ido-setup-hook 'noah-ido-config)
  )


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
;; Mumamo is making emacs 23.3 freak out:
;;;;;;;;;;;;;;;;;;;;
;; (when (and (equal emacs-major-version 23)
;;            (equal emacs-minor-version 3))
;;   (eval-after-load "bytecomp"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function))
;;   ;; tramp-compat.el clobbers this variable!
;;   (eval-after-load "tramp-compat"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function)))

;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;
;; (require 'package)
;; (setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
;; (package-initialize)

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")



;;;;;;;;;;;;;;;;;;;;
;; visual stuff
;;;;;;;;;;;;;;;;;;;;
(setq-default fill-column 80)
(defun ash-term-hooks ())
;; (setq term-default-bg-color (face-background 'default))
;; (setq term-default-fg-color (face-foreground 'default)))
(add-hook 'term-mode-hook 'ash-term-hooks)

(setq split-height-threshold nil)
(setq split-width-threshold 0)
(setq ring-bell-function 'ignore)
(setq highlight-parentheses-mode t)
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(setq toolbar nil)
(defface pm/default '((t nil)) "Basic default face.")
(setq mumamo-background-chunk-major 'pm/default)
(transient-mark-mode 1)
(setq inhibit-splash-screen t)
(column-number-mode 1)



(message "Done Loading...now what?")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu t)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(c-basic-offset 2)
 '(c-default-style "k&r")
 '(c-hanging-braces-alist (quote ((block-close . c-snug-do-while) (statement-cont) (substatement-open after) (extern-lang-open after) (namespace-open after) (module-open after) (composition-open after) (inexpr-class-open after) (inexpr-class-close before) (arglist-cont-nonempty))))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-old-versions t)
 '(exec-path (quote ("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/X11/bin" "/Users/noah/bin")))
 '(hl-paren-colors (quote ("firebrick1" "" "" "")))
 '(ido-auto-merge-delay-time 0.3)
 '(ido-default-buffer-method (quote selected-window))
 '(js2-global-externs (list "$" "jQuery" "iimDisplay" "iimPlay" "iimGetLastError" "iimGetLastExtract" "log_error" "breakpoint" "window" "require" "console" "exports" "process" "it" "describe" "before" "beforeEach" "after" "afterEach" "setTimeout" "__dirname" "module" "Buffer" "setInterval" "clearInterval" "emit" "gBrowser" "FormData"))
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning t)
 '(kill-ring-max 5000)
 '(scroll-bar-mode nil)
 '(show-paren-style (quote expression))
 '(solarized-contrast (quote low))
 '(split-width-threshold 1600)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks nil))

(defun term() (interactive)
  (multi-term))

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name))))
  )

;; (setq ispell-program-name "aspell")
;; ;; (add-hook 'markdown-mode-hook

;; ;;   (lambda()
;;     ;; (flyspell-mode 1)))
;; ;;;;;;;;;;;;;;;;;;;;
;; ;; Use the Emacs-W3M Web Browser
;; ;;;;;;;;;;;;;;;;;;;;
;; ;; (require 'w3m)
;; ;; ;(require 'w3m-e23)
;; ;; (setq browse-url-browser-function 'w3m-browse-url)
;; ;;  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; ;;  ;; optional keyboard short-cut
;; ;;  (global-set-key "\C-xm" 'browse-url-at-point)
;; (require 'w3m)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "#81908f" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(helm-selection ((t (:background "midnight blue" :underline t))))
 '(hl-line ((t (:background "#E1E1B2"))) t)
 '(ido-only-match ((t (:background "#003946" :foreground "green" :weight bold)))))
(put 'downcase-region 'disabled nil)
