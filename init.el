;; .emacs.d/init.el startup file for emacs.
;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;; User Info
(setq user-full-name "Harry Callahan")
(setq user-mail-address "harry.callahan@renishaw.com")

(setq debug-on-error t)
(message "* --[ Loading Harry's Emacs init file ]--")

;; measure startup times
;; (setq emacs-load-start-time (current-time))


;; Setup package archives
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
			 '(("melpa" . "http://melpa.org/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("org" . "http://orgmode.org/elpa/")
			 ("elpy" . "http://jorgenschaefer.github.io/packages/"))))
(package-initialize)

;; https://github.com/jwiegley/use-package
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
;(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Now we can use "use-package" to install and configure our packages!

;; At this point, we should use load-file to add files containing all of our configs.
;; eg (load-file "~/.emacs.d/config/init-10-face.el")

;; === emacs Appearance ===
(load-file "~/.emacs.d/config/init-10-appearance.el")

;; === Interface ===
(load-file "~/.emacs.d/config/init-20-interface.el")

;; === Document Editing ===
;; (load-file "~/.emacs.d/config/init-30-doc-gen.el")
(load-file "~/.emacs.d/config/init-31-doc-org.el")

;; === Programming & Coding Functions ===
(load-file "~/.emacs.d/config/init-40-coding-gen.el")
(load-file "~/.emacs.d/config/init-41-coding-vhdl.el")
(load-file "~/.emacs.d/config/init-42-coding-python.el")

;; === misc ===
;; (load-file "~/.emacs.d/config/init-70-misc-ledger.el")

;; Move the customize interface commands to a new file.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; emacs auto-save files are placed in the TEMP directory
;; https://www.emacswiki.org/emacs/AutoSave
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

;; Stop the creation of #. lockfiles in the working directory
(setq create-lockfiles nil)

;;; init.el ends here

(put 'erase-buffer 'disabled nil)
