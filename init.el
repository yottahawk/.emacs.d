;; .emacs.d/init.el startup file for emacs.
;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

;; User Info
(setq user-full-name "Harry Callahan")
(setq user-mail-address "harry.callahan@renishaw.com")

(setq debug-on-error t)
(message "* --[ Loading my Emacs init file ]--")

;; measure startup times
;; (setq emacs-load-start-time (current-time))

;; The below lines set up emacs to use the Renishaw Proxy when fetching packages.
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "127.0.0.1:3128")
     ("https" . "127.0.0.1:3128")))
(setq url-http-proxy-basic-auth-storage
    (list (list "wg.uk.wrproxy.com:3128"
                (cons "Input your LDAP UID !"
                      (base64-encode-string "LOGIN:PASSWORD")))))



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
(require 'diminish)                ;; if you use :diminish
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
;; (load-file "~/.emacs.d/config/init-31-doc-org.el")

;; === Programming & Coding Functions ===
(load-file "~/.emacs.d/config/init-40-coding-gen.el")
(load-file "~/.emacs.d/config/init-41-coding-vhdl.el")

;; === misc ===
;; (load-file "~/.emacs.d/config/init-70-misc-ledger.el")

;;; init.el ends here
