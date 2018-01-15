;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(ein
    elpy
    flycheck
    material-theme
    dracula-theme
    py-autopep8
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
;(load-theme 'material t) ;; load material theme
(load-theme 'dracula t)
(global-linum-mode t) ;; enable line numbers globally
(set-face-attribute 'default nil :font "Monaco-12") ;; set default font
(menu-bar-mode -1) ;; hide menu bar
(when (fboundp 'tool-bar-mode) ;; hide tool bar
  (tool-bar-mode -1))
(toggle-scroll-bar -1) ;; disable scroll bar

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;(elpy-use-ipython)
;(setq ansi-color-for-comint-mode t)

;; use flycheck instead of flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; C CONFIGURATION
;; --------------------------------------

(defun c-lineup-arglist-tabs-only (ignored)
    "Line up argument lists by tabs, not spaces"
    (let* ((anchor (c-langelem-pos c-syntactic-element))
           (column (c-langelem-2nd-pos c-syntactic-element))
           (offset (- (1+ column) anchor))
           (steps (floor offset c-basic-offset)))
      (* (max steps 1)
         c-basic-offset)))

  (add-hook 'c-mode-common-hook
            (lambda ()
              ;; Add kernel style
              (c-add-style
               "linux-tabs-only"
               '("linux" (c-offsets-alist
                          (arglist-cont-nonempty
                           c-lineup-gcc-asm-reg
                           c-lineup-arglist-tabs-only))))))

  (add-hook 'c-mode-hook
            (lambda ()
              (let ((filename (buffer-file-name)))
                ;; Enable kernel mode for the appropriate files
                (when (and filename
                           (string-match (expand-file-name "~/src/linux-trees")
                                         filename))
                  (setq indent-tabs-mode t)
                  (setq show-trailing-whitespace t)
                  (c-set-style "linux-tabs-only")))))


;; init.el ends here
