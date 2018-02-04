;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages ;; M-x package-refresh-contents RET after adding a package
  '(ein
    elpy
    flycheck
    dracula-theme
    py-autopep8
    magit
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; BASIC CUSTOMIZATION
;; --------------------------------------

;; move temp save files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'dracula t) ;; load theme
(global-linum-mode t) ;; enable line numbers globally
(set-face-attribute 'default nil :font "Monaco-12") ;; set default font
(menu-bar-mode -1) ;; hide menu bar
(when (fboundp 'tool-bar-mode) ;; hide tool bar
  (tool-bar-mode -1))
(toggle-scroll-bar -1) ;; disable scroll bar

;; CUSTOM KEYBINDS
;; --------------------------------------

(global-set-key (kbd "C-x g") 'magit-status)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)

;; use flycheck instead of flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; C CONFIGURATION
;; --------------------------------------

(setq c-default-style "linux"
          c-basic-offset 4)

;; init.el ends here
