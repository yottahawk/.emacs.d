;; init-10-appearance.el
;; Customize the appearance of emacs

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;;; Code:

(use-package indent-guide)
(use-package highlight-indent-guides)
(use-package linum-relative)
(use-package smart-mode-line
  :after powerline
  :after smart-mode-line
  :init
  (progn
    (setq sml/no-confirm-load-theme t)
    (sml/setup)
    (sml/apply-theme 'dark)))
    


 ;; Set a default theme of Tassilo
(load-theme 'tsdh-dark)
;; Set the default font to "InputMonoNarrow" for all configurations
(custom-set-faces '(default ((t (:family "InputMonoNarrow" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
;; Default cursor type to bar
(setq-default cursor-type 'bar) 
;; Highlighted text is deleted when typing
(delete-selection-mode 1)


(desktop-save-mode 1) ;; Enable automated desktop saving
;; Setup emacs to place any backups and autosaves into the windows temp directory
(setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Ensure line numbers are visible in all buffers
(global-linum-mode t)


