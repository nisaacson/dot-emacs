(require 'markdown-mode)
;;   "Major mode for editing files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(eval-after-load 'markdown-mode
   '(define-key markdown-mode-map (kbd "C-c r") 'markdown-preview-file))

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name))))
  )


