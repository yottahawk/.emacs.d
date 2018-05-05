;; init-10-appearance.el
;; Customize emacs interface (and navigation)

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;;; Code:

(use-package multishell)
(add-hook 'shell-mode-hook 'my-shell-mode-hook 'compilation-shell-minor-mode)
;; Ensure all compilation links inside a shell window are clickable.
(defun my-shell-mode-hook ()
  (process-send-string (get-buffer-process (current-buffer))
                       "export TERM=xterm-256color\n"))

(use-package ag)
(use-package helm-ag
  :bind (("M-x" . helm-M-x)))
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))
(use-package ranger)
;; User ranger mode instead of dired by default
(ranger-override-dired-mode t)
(use-package which-key)
(use-package undo-tree)
;;(use-package browse-kill-ring+)

;; Start emacs server mode, to allow ActiveHDL to open files inside an active window
(server-start)

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set bind-key global keybinds that cannot be overwritten by major-modes.
(bind-keys*
 ("C-k" . next-buffer)
 ("C-j" . previous-buffer)
 ("C-z" . undo))

;; Function to temporarily maximise a buffer
(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_) 
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(global-set-key (kbd "<C-f1>") 'toggle-maximize-buffer)

