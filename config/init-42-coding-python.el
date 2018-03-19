;;; init-42-coding-python.el --- Emacs configuration for python programming.

;; Harry Callahan
;; harry.callahan@renishaw.com
;; hcalla93@gmail.com

(use-package jedi-core
  :ensure
  :config
  (setq jedi:use-shortcuts t) ; M-. and M-,
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:environment-root "jedi")
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/bin/python3"))))

(use-package elpy
  :config
  (elpy-enable))
