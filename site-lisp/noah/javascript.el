;; (autoload 'js3-mode "js3-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))


(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))


(defadvice js2-reparse (before json)
  (setq js2-buffer-file-name buffer-file-name))
(ad-activate 'js2-reparse)

(defadvice js2-parse-statement (around json)
  (if (and (= tt js2-LC)
           js2-buffer-file-name
           (string-equal (substring js2-buffer-file-name -5) ".json")
           (eq (+ (save-excursion
                    (goto-char (point-min))
                    (back-to-indentation)
                    (while (eolp)
                      (next-line)
                      (back-to-indentation))
                    (point)) 1) js2-ts-cursor))
      (setq ad-return-value (js2-parse-assign-expr))
    ad-do-it))
(ad-activate 'js2-parse-statement)
(add-hook 'js2-mode-hook
          '(lambda()
             (yas/minor-mode-on)))

(defun js2-newline-key ()
  (interactive)
      (newline-and-indent)
      )
  ;; (let ((parse-status (save-excursion
  ;;                       (parse-partial-sexp (point-min) (point)))))
  ;;   (if (nth 4 parse-status)
  ;;       ;; check if inside a block comment
  ;;       (js2-mode-extend-comment)

  ;;     )

  ;;   ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Javascript keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun noah-add-js2-keys ()
  (local-set-key (kbd "C-j") 'js2-newline-key))

(defun my-js2-sources ()
  (setq ac-sources '(ac-source-filename ac-source-words-in-buffer ac-source-words-in-same-mode-buffers ac-source-yasnippet )))

(add-hook 'js2-mode-hook 'my-js2-sources)
(add-hook 'js2-mode-hook 'noah-add-js2-keys)
(add-hook 'js2-mode-hook '(lambda ()
                            (setq js2-missing-semi-one-line-override t)))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "C-c C-d") 'js2-next-error)))
