;; Org-Mode customizations

;; (use-package org-wiki)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Install org-wiki from Github if it is not already installed.
(if (require 'org-wiki nil 'noerror)
    (print "Already installed!")
  (let ((url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"))
      (with-current-buffer (url-retrieve-synchronously url)
	(goto-char (point-min))
	(re-search-forward "^$")
	(delete-region (point) (point-min))
	(kill-whole-line)
	(package-install-from-buffer))))
