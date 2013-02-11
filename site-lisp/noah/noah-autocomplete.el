;; ;;;;;;;;;;;;;;;;;;;;
;; ;; autocomplete
;; ;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/noah/.emacs.d/vendor/autocomplete/dict")

(setq-default ac-sources '(ac-source-filename ac-source-files-in-current-dir ac-source-yasnippet ac-source-words-in-buffer ac-source-words-in-same-mode-buffers ac-source-words-in-all-buffer))
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
(setq yas/root-directory "~/.emacs.d/vendor/yasnippet/snippets")
(yas-global-mode)
(yas/load-directory yas/root-directory)

;; ;; Replace yasnippets's TAB
;; (add-hook 'yas/minor-mode-hook
;;           (lambda () (define-key yas/minor-mode-map
;;                        (kbd "TAB") 'smart-tab))) ; was yas/expand


;; ;;;;;;;;;;;;;;;;;;;;
;; ;; anything
;; ;;;;;;;;;;;;;;;;;;;;

;; ; case sensitivity is important when finding matches
;; (setq ac-ignore-case nil)

(require 'helm-config)
(setq helm-match-plugin-mode t)
(provide 'noah-autocomplete)
