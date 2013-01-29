;;;;;;;;;;;;;;;;;;;;
;; keyboard stuff
;;;;;;;;;;;;;;;;;;;;
;; (global-set-key (kbd "C-.") 'shift-right)
;; (global-set-key (kbd "C-,") 'shift-left)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key [C-tab]
    (lambda ()
      (interactive)
      (other-window -1)))

(add-hook 'python-mode-hook (local-set-key (kbd "C-c c") 'comment-or-uncomment-region))
(add-hook 'python-mode-hook (local-set-key (kbd "C-c i") 'camelCase-mode))
(add-hook 'python-mode-hook (local-set-key (kbd "M-c") 'capitalize-word))

(add-hook 'php-mode-hook (local-unset-key (kbd "C-c C-n")))
(add-hook 'php-mode-hook (local-unset-key (kbd "M-q")))
(add-hook 'php-mode-hook (local-unset-key (kbd "C-c C-p")))
(add-hook 'php-mode-hook (local-set-key (kbd "C-c C-p") 'php-beginning-of-defun))
(add-hook 'php-mode-hook (local-set-key (kbd "C-c C-n") 'php-end-of-defun))

(global-set-key (kbd "C-c t") 'indent-buffer-2)

;; (global-set-key (kbd "M-/") 'yas/expand)

(global-set-key (kbd "C-x o") 'stop-using-minibuffer-and-other-window)
(global-set-key (kbd "C-x o") 'stop-using-minibuffer-and-other-window)

(global-set-key (kbd "C-M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-c f") 'find-alternate-file)

(global-set-key (kbd "M-p") 'fill-region-as-paragraph)
                                        ;(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-sexp)

(global-set-key (kbd "C-c i") 'camelCase-mode)
(global-set-key (kbd "C-c o") 'quoted-insert)
(global-set-key (kbd "C-c n") 'bc-next)
(global-set-key (kbd "C-c p") 'bc-previous)
(global-set-key (kbd "C-c s") 'bc-set)
(global-set-key (kbd "C-c b") 'bc-set)
(global-set-key (kbd "C-c d") 'bc-menu-mark-delete)
(global-set-key (kbd "C-c x") 'bc-menu-commit-deletions)
(global-set-key (kbd "C-c l") 'bc-list)
(setq mac-option-modifier 'meta)
(global-set-key (kbd "M-<f2>") 'whitespace-cleanup)
(global-set-key [(control tab)] 'indent-next-line)
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")   'buf-move-right)
(global-set-key (kbd "C-c <right>") 'buf-move-right)
(global-set-key (kbd "C-x C-v") 'revert-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "C-x C-v") 'revert-buffer)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; (global-set-key (kbd "C-\ ") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-i") 'anything-imenu)
(global-set-key [(tab)] 'smart-tab)


(global-set-key (kbd "<f10>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f11>") 'highlight-symbol-next)
(global-set-key (kbd "<f12>") 'highlight-symbol-prev)
(global-set-key (kbd "C-c m") 'markdown)

(global-set-key (kbd "C-c r") 'markdown-preview-file)

;; (defun smart-tab ()
;;   "This smart tab is minibuffer compliant: it acts as usual in
;;     the minibuffer. Else, if mark is active, indents region. Else if
;;     point is at the end of a symbol, expands it. Else indents the
;;     current line."
;;   (interactive)
;;   (if (minibufferp)
;;       (unless (minibuffer-complete)
;;         (dabbrev-expand nil))
;;     (if mark-active
;;         (indent-region (region-beginning)
;;                        (region-end))
;;       (if (looking-at "\\_>")
;;           (dabbrev-expand nil)
;;         (indent-for-tab-command)))))
                                        ;Make other-frame instinctive
;; (global-set-key (kbd "C-c o") 'other-frame)

;; better buffer switching
(global-set-key (kbd "<f9>") 'bs-show)

;; find and replace
(global-set-key (kbd "M-r") 'query-replace)
(defalias 'yes-or-no-p 'y-or-n-p)
;; don't use tabs, only use spaces
(setq-default indent-tabs-mode nil)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))


(defun shift-text (distance)
  (if (use-region-p)
      (let ((mark (mark)))
        (save-excursion
          (indent-rigidly (region-beginning)
                          (region-end)
                          distance)
          (push-mark mark t t)
          (setq deactivate-mark nil)))
    (indent-rigidly (line-beginning-position)
                    (line-end-position)
                    distance)))

(defun shift-right-sws (count)
  (setq count 2)
  (interactive "p")
  (shift-text count))

(defun shift-left-sws (count)
  (setq count -2)
  (interactive "p")
  (shift-text count))

(defun indent-buffer-2 ()
  "Indent the buffer 2"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))
    )
  )

(global-set-key (kbd "C-.") 'shift-right-sws)
(global-set-key (kbd "C-,") 'shift-left-sws)
(add-hook 'jade-mode-hook
          (lambda ()
            ;; (local-unset-key (kbd "C-,"))
            ;; (local-unset-key (kbd "C-."))
            ;; (local-unset-key (kbd "C-,"))
            (local-set-key (kbd "C-,") 'shift-left-sws)
            (local-set-key (kbd "C-.") 'shift-right-sws)
            )
          )
