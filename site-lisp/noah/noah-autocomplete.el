;; ;;;;;;;;;;;;;;;;;;;;
;; ;; autocomplete
;; ;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/ac-dict")
(ac-config-default)

;; (global-auto-complete-mode t)
(setq ac-use-menu-map t)
(define-key ac-completing-map "\e" 'ac-stop) ; use esc key to exit completion
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-dwim t)

;; start completing immediatly
(setq ac-auto-start 1)

;; ;;   (require 'auto-complete-yasnippet)
;; ;;   (require 'auto-complete-css)
;; ;;   (require 'auto-complete-cpp)
;; ;;   (require 'auto-complete-emacs-lisp)
;; ;;   (require 'auto-complete-semantic)
;; ;;   (require 'auto-complete-gtags)
;; ;;;;;;;;;;;;;;;;;;;;
;; ;; YASnippet
;; ;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-global-mode)
(setq yas/root-directory "~/.emacs.d/vendor/yasnippet/snippets")
(yas/load-directory yas/root-directory)

;; ;; Replace yasnippets's TAB
;; (add-hook 'yas/minor-mode-hook
;;           (lambda () (define-key yas/minor-mode-map
;;                        (kbd "TAB") 'smart-tab))) ; was yas/expand


;; ;;;;;;;;;;;;;;;;;;;;
;; ;; anything
;; ;;;;;;;;;;;;;;;;;;;;
(require 'anything)
(require 'anything-match-plugin)
(require 'anything-config)

;; (require 'ac-anything)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/ac-dict")
;; ; Use dictionaries by default
(set-default 'ac-sources '(ac-source-abbrev ac-source-yasnippet  ac-source-words-in-buffer ac-source-dictionary))
;; (global-auto-complete-mode t)
;; ; Start auto-completion after 2 characters of a word
;; (setq ac-auto-start 2)
;; ; case sensitivity is important when finding matches
;; (setq ac-ignore-case nil)

;; (defun my-anything ()
;;   (interactive)
;;   (anything-other-buffer
;;    '(anything-c-source-buffers
;;      anything-c-source-file-name-history
;;      anything-imenu
;;      anything-c-source-emacs-commands)
;;    " *my-anything*"))



;; ;; (add-to-list 'ac-dictionary-directories (concat libfiles-dir "/ac-dict"))


;; ;;(setq popup-kill-ring-interactive-insert t)


;; ;; tab expansion with hippie and yas
;; ;; from https://gist.github.com/215930

;; (setq hippie-expand-try-functions-list
;;       '(yas/hippie-try-expand
;;         try-complete-file-name-partially
;;         try-expand-all-abbrevs
;;         try-expand-dabbrev
;;         try-expand-dabbrev-all-buffers
;;         try-expand-dabbrev-from-kill
;;         try-complete-lisp-symbol-partially
;;         try-complete-lisp-symbol))


;; ;; Helps when debugging which try-function expanded
;; (setq hippie-expand-verbose t)
;; (yas/global-mode 1)

;; (defvar smart-tab-using-hippie-expand t
;;   "turn this on if you want to use hippie-expand completion.")

;; (defun smart-tab (prefix)
;;   "Needs `transient-mark-mode' to be on. This smart tab is
;;   minibuffer compliant: it acts as usual in the minibuffer.

;;   In all other buffers: if PREFIX is \\[universal-argument], calls
;;   `smart-indent'. Else if point is at the end of a symbol,
;;   expands it. Else calls `smart-indent'."
;;   (interactive "P")
;;   (labels ((smart-tab-must-expand (&optional prefix)
;;                                   (unless (or (consp prefix)
;;                                               mark-active)
;;                                     (looking-at "\\_>"))))
;;     (cond ((minibufferp)
;;            (minibuffer-complete))
;;           ((smart-tab-must-expand prefix)
;;            (if smart-tab-using-hippie-expand
;;                (hippie-expand prefix)
;;              (dabbrev-expand prefix)))
;;           ((smart-indent)))))

;; (defun smart-indent ()
;;   "Indents region if mark is active, or current line otherwise."
;;   (interactive)
;;   (if mark-active
;;     (indent-region (region-beginning)
;;                    (region-end))
;;     (indent-for-tab-command)))

;; ;; Bind tab everywhere
;; (global-set-key (kbd "TAB") 'smart-tab)

;; ;; Enables tab completion in the `eval-expression` minibuffer
;; (define-key read-expression-map [(tab)] 'hippie-expand)
;; (define-key read-expression-map [(shift tab)] 'unexpand)



(provide 'noah-autocomplete)
