(defun color-theme-ps-warm ()
  "A color theme based on Vim's PS Warm 2."
  (interactive)
  (color-theme-install
   '(color-theme-ps-warm
     ((background-color . "#111111")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "grey10"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#9FC1E6" :foreground "black"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#E1DE82"))))
     (font-lock-constant-face ((t (:foreground "#ACCFE8"))))
     (eshell-prompt ((t (:foreground "#00FF00"))))
     (eshell-ls-readonly ((t (:foreground "#ACCFE8"))))
     (eshell-ls-directory ((t (:foreground "#AA00FF"))))
     (font-lock-doc-face ((t (:foreground "#E1DE82"))))
     (font-lock-keyword-face ((t (:foreground "#E6CE6B" :bold t))))
     (font-lock-string-face ((t (:foreground "#549dd7" :italic t))))
     (font-lock-type-face ((t (:foreground "#9FA5EE" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#F5C6F9"))))
     (font-lock-warning-face ((t (:bold t :foreground "#F5A94A"))))
     (font-lock-function-name-face ((t (:foreground "#F8C9EF" :bold t :italic t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (dired-directory ((t (:foreground "#549dd7"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     (mumamo-background-chunk-major ((t (:background nil))))
     (mumamo-background-chunk-submode1 ((t (:background "#111111"))))
     (mumamo-background-chunk-submode2 ((t (:background "#222222"))))
	 (org-level-1 ((t (:foreground "MediumPurple1" :bold t :height 200))))
	 (org-level-2 ((t (:foreground "DarkOrange1" :bold t :height 190))))
	 (org-level-3 ((t (:foreground "firebrick2" :bold t :height 180))))
	 (org-level-4 ((t (:foreground "LightGoldenrod2" :bold t :height 170))))
	 (variable-pitch ((t (:family "Gill Sans"))))
	 (diff-removed ((t (:foreground "brown1"))))
	 (diff-added ((t (:foreground "SeaGreen1"))))
	 (diff-hunk-header ((t (:foreground "RoyalBlue3"))))
	 (diff-header ((t (:foreground "SkyBlue3" :background "black"))))
	 (diff-file-header ((t (:foreground "SkyBlue3" :background "black"))))
	 ;; (magit-item-highlight ((t (:background "gray20"))))
	 ;; (magit-section-title ((t (:foreground "SkyBlue3" :background "black"))))
	 (highline-face ((t (:background "#151533"))))
	 (viper-minibuffer-insert ((t (:foreground "white" :background "black"))))
	 (viper-minibuffer-emacs ((t (:foreground "white" :background "black"))))
	 (smerge-refined-change ((t (:background "#111111"))))
	 (rng-error ((t (:background "#222222"))))
	 (rst-level-1-face ((t (:family "Gill Sans"  :bold t :height 200 :background "black"))))
	 (rst-level-2-face ((t (:family "Gill Sans" :bold t :height 180 :background "black"))))
	 (rst-level-3-face ((t (:family "Gill Sans" :bold t :height 160 :background "black"))))
	 (rst-level-4-face ((t (:family "Gill Sans" :bold t :height 140 :background "black"))))
	 (rst-level-4-face ((t (:family "Gill Sans" :bold t :height 120 :background "black"))))
	 (rst-level-5-face ((t (:family "Gill Sans" :bold t :height 100 :background "black"))))
	 (yas/field-debug-face ((t (:background "#222222"))))
     )))

(provide 'color-theme-ps-warm)
