;; add everything inside site-lisp directory to load path
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; various libraries
;;(require 'noah_backup)
(require 'breadcrumb)
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
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; (load-file "~/.emacs.d/site-lisp/noah/color-theme-twilight-noah.el")
;; (load-file "~/.emacs.d/site-lisp/noah/color-theme-ps-warm.el")

(load-file "~/.emacs.d/site-lisp/noah/smart-tab-everywhere.el")
(add-hook 'before-save-hook 'whitespace-cleanup)

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
;; (require 'make-mark-visible)
(require 'markdown-mode);
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

;; load gtags for navigating through source code
(setq load-path (cons "/opt/local/share/gtags/" load-path))
(autoload 'gtags-mode "gtags" "" t)

;(autoload 'idomenu "idomenu" nil t)
(require 'idomenu)
;; (load "~/.emacs.d/vendor/nxhtml/autostart.el")
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
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; treat camelCase subwords as seperate
(camelCase-mode 1)
(autoload 'camelCase-mode "camelCase/camelCase-mode")
(add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))
(add-hook 'find-file-hook '(lambda () (camelCase-mode 1)))
(add-hook 'php-mode-hook '(lambda () (camelCase-mode 1)))
(add-hook 'python-mode-hook '(lambda () (camelCase-mode 1)))
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



;; default sources of candidates
(require 'noah-autocomplete)

;;;;;;;;;;;;;;;;;;;;
;; python
;;;;;;;;;;;;;;;;;;;;
;; (require 'epy-setup) ;; It will setup other loads, it is required!
;; (require 'epy-python) ;; If you want the python facilities [optional]
;; ;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing) ;; For configurations related to editing [optional]
;; (require 'epy-bindings) ;; For my suggested keybindings [optional]
;; (epy-django-snippets) ;; load django snippets

;;;;;;;;;;;;;;;;;;;;
;; pymacs - disabled
;;;;;;;;;;;;;;;;;;;;
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))



;;;;;;;;;;;;;;;;;;;;
;; broader ido support
;;;;;;;;;;;;;;;;;;;;
;; (defvar ido-enable-replace-completing-read t)
;;   "If t, use ido-completing-read instead of completing-read if possible.

;; Set it to nil using let in around-advice for functions where the
;; original completing-read is required.  For example, if a function
;; foo absolutely must use the original completing-read, define some
;; advice like this:

;; ;(defadvice foo (around original-completing-read-only activate)
;;   (let (ido-enable-replace-completing-read) ad-do-it))"

;; ;; Replace completing-read wherever possible, unless directed otherwise
;; (defadvice completing-read
;;   (around use-ido-when-possible activate)
;;   (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
;;           (boundp 'ido-cur-list)) ; Avoid infinite loop from ido calling this
;;       ad-do-it
;;     (let ((allcomp (all-completions "" collection predicate)))
;;       (if allcomp
;;           (setq ad-return-value
;;                 (ido-completing-read prompt
;;                                allcomp
;;                                nil require-match initial-input hist def))
;;         ad-do-it))))

(defun rename-file-and-buffer (new-name)
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

(load-file "~/.emacs.d/site-lisp/noah/shortcuts.el")
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
 '(js2-global-externs (list "$" "jQuery" "iimDisplay" "iimPlay" "iimGetLastError" "iimGetLastExtract" "log_error" "breakpoint" "window" "require" "console" "exports" "process" "it" "describe" "before" "beforeEach" "after" "afterEach" "setTimeout" "__dirname" "module" "Buffer"))
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(kill-ring-max 5000)
 '(markdown-css-path "http://twitter.github.com/bootstrap/assets/css/bootstrap.css")
 '(python-python-command "/usr/local/bin/python")
 '(scroll-bar-mode nil)
 '(show-paren-style (quote expression))
 '(solarized-contrast (quote low))
 '(split-width-threshold 1600)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks nil))

;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(ac-candidate-face ((t (:background "controlHighlightColor" :foreground "Blue"))))
 ;; '(font-lock-comment-face ((t (:foreground "#AF5D00"))))
 ;; '(font-lock-warning-face ((t (:background "black" :foreground "red"))))
 ;; '(js2-external-variable-face ((t (:foreground "#FF3333"))))
 ;; '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#0f0f0f"))))
 ;; '(mumamo-background-chunk-submode ((t nil)))
 ;; '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#1F1F1F"))))
 ;; '(secondary-selection ((t (:background "controlTextColor"))))
 ;; '(show-paren-match ((t (:foreground "#34C24A"))))
 ;; '(yas-field-highlight-face ((t (:inherit (quote background-region))))))


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
 '(hl-line ((t (:background "#E1E1B2"))) t)
 '(ido-only-match ((t (:background "#003946" :foreground "green" :weight bold)))))
