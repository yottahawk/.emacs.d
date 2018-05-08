;; init-10-appearance.el
;; Customize emacs interface (and navigation)

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;;; Code:

(use-package multishell)
;; (add-hook 'shell-mode-hook 'my-shell-mode-hook 'compilation-shell-minor-mode)
;; ;; Ensure all compilation links inside a shell window are clickable.
;; (defun my-shell-mode-hook ()
;;   (process-send-string (get-buffer-process (current-buffer))
;;                        "export TERM=xterm-256color\n"))

(use-package ag)
(use-package helm-ag
  :bind (("M-x" . helm-M-x)))
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))
(use-package ranger
  :init
  ;; Slightly strange behaviour that the literal previews seem to always toggle-off when ranger is closed, so
  ;; adding a hook to always toggle-on means that we always see literal previews when starting ranger.
  (add-hook 'ranger-mode-load-hook 'ranger-toggle-literal)
  :config
  (ranger-override-dired-mode t) ;; User ranger mode instead of dired by default
  (setq ranger-cleanup-on-disable t
	ranger-cleanup-eagerly t)
  (define-key ranger-normal-mode-map (kbd "C-h") nil)
  :bind
  ;; ("C-h" . nil)
  )
(use-package which-key
  :config
  (which-key-mode)
  )
(use-package undo-tree)
;;(use-package browse-kill-ring+)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-file-event-delay           5000
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      50)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"        . treemacs-select-window)
        ("C-c 1"      . treemacs-delete-other-windows)
	("M-m"        . nil) ;; Remove the old keybinding
        ("M-m ft"     . treemacs)
        ("M-m fB"     . treemacs-bookmark)
        ("M-m f C-t"  . treemacs-find-file)
        ("M-m f M-t"  . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs
  :ensure t)

(use-package treemacs-projectile
  :after treemacs
 :ensure t)

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

