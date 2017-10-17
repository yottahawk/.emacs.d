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

(use-package multiple-cursors
  :bind
  ("C-c m c" . mc/edit-lines))
(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind
  ("M-p" . ace-window))
(use-package sr-speedbar
  :init
  (setq speedbar-use-images nil
        sr-speedbar-right-side nil)  
  :bind
  ("M-s" . sr-speedbar-toggle))
(use-package magit
  :defer t)
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




