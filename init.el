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
    haskell-mode
    multiple-cursors
    neotree
    all-the-icons
    telephone-line
    anaconda-mode
    racket-mode
    paredit
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
(setq column-number-mode t) ;; display column number
(set-face-attribute 'default nil :font "Monaco-12") ;; set default font
(menu-bar-mode -1) ;; hide menu bar
(when (fboundp 'tool-bar-mode) ;; hide tool bar
  (tool-bar-mode -1))
(toggle-scroll-bar -1) ;; disable scroll bar
(global-prettify-symbols-mode +1) ;; globally use prettify-symbols

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

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; C CONFIGURATION
;; --------------------------------------

(setq c-default-style "linux"
          c-basic-offset 4)

;; JAVA CONFIGURATION
;; --------------------------------------

; point to jdee-server
(setq jdee-server-dir "/home/bram/.emacs.d/jdee-server")

; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; RACKET CONFIGURATION
;; --------------------------------------

;(require 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; OTHER CONFIGS
;; --------------------------------------
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(global-set-key [f8] 'neotree-toggle)

(require 'telephone-line)
(telephone-line-mode 1)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; init.el ends here
