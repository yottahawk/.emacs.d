;; init-10-appearance.el
;; Customize emacs interface (and navigation)

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;;; Code:

(use-package ag)
(use-package helm-ag
  :bind (("M-x" . helm-M-x)))
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))
(use-package ranger)
(use-package minimap)
(use-package undo-tree)
(use-package browse-kill-ring+)

;; Start emacs server mode, to allow ActiveHDL to open files inside an active window
(server-start)

;; User ranger mode instead of dired by default
;; (ranger-override-dired-mode t)
