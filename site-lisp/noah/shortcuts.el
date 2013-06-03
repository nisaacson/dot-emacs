;;;;;;;;;;;;;;;;;;;;
;; keyboard stuff
;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c q") 'quoted-insert)
(global-set-key (kbd "C-o") 'er/expand-region)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)




(global-set-key (kbd "C-c t") 'indent-buffer-2)


;; (global-set-key (kbd "C-x o") 'stop-using-minibuffer-and-other-window)
;; (global-set-key (kbd "C-x o") 'stop-using-minibuffer-and-other-window)

(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c f") 'find-alternate-file)

(global-set-key (kbd "M-p") 'fill-region-as-paragraph)
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
(global-set-key (kbd "C-q") 'set-mark-command)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")   'buf-move-right)
(global-set-key (kbd "C-c <right>") 'buf-move-right)
(global-set-key (kbd "C-x C-v") 'revert-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "C-x C-v") 'revert-buffer)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-i") 'helm-imenu)
(global-set-key (kbd "M-r") 'query-replace)


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
