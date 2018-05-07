;;; init-40-coding-gen.el --- Code for general programming

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;;; Commentary:
;; General tools for programming across languages.  This consists of: eg.
;;   Company :: used for code completion
;;   Projectile :: used for searching projects
;;   Magit :: used for interfacing with git/github
;;   Flycheck :: code syntax/convention checking
;; helm-gtags vhdl-tools  ggtags helm-projectile flx-ido projectile

(use-package projectile
  :init
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action 'projectile-dired)  
  :bind
  ("C-x M-t" . projectile-term))
(use-package helm-projectile
  :init
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))
(use-package ibuffer-projectile
  :init
  ;; Make ibuffer windows sort buffers by projectile projects
  (add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic)))))

;; (use-package sr-speedbar
;;   :init
;;   (setq speedbar-use-images nil)
;; ;;        sr-speedbar-right-side nil)
;;   :bind
;;   ("M-s" . sr-speedbar-toggle))


(use-package multiple-cursors
  :bind
  ("C-c m c" . mc/edit-lines))
(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (bind-keys*
    ("M-i" . ace-window)))


(use-package magit
  :init
  (bind-keys*
    ("C-x g" . magit-status)))  
(use-package smart-tabs-mode
  :init
  ;; All programming modes to use indent highlighting
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  ;; Setup smart-tabs for vhdl mode
  (smart-tabs-advice vhdl-indent-line vhdl-basic-offset)
  ;; nil sets the indent mode to use spaces
  (setq vhdl-indent-tabs-mode nil))

;; (use-package magit               
;;   :ensure t
;;   :bind (("C-c v c" . magit-clone)
;;          ("C-c v v" . magit-status)
;;          ("C-c v g" . magit-blame)
;;          ("C-c v l" . magit-log-buffer-file)
;;          ("C-c v p" . magit-pull))
;;   :config (setq magit-save-repository-buffers 'dontask))


(defun projectile-term ()
  "Create an ansi-term at the project root"
  (interactive)
  (let ((root (projectile-project-root))
	(buff-name (concat " [term] " (projectile-project-root))))
    (if (get-buffer buff-name)
      (switch-to-buffer-other-window buff-name)
      (progn
	(split-window-sensibly (selected-window))
	(other-window 1)
	(setq default-directory root)
	(shell (getenv "SHELL"))
	(rename-buffer buff-name t)))))
