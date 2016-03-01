(menu-bar-mode -1)
(hl-line-mode t)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(column-number-mode t)
(line-number-mode t)

(require 'paren)
(show-paren-mode)

(add-to-list 'auto-mode-alist '("\\.eliom\\'" . tuareg-mode))

;;(require 'whitespace)
;;(global-whitespace-mode t)

;; YCM configuration

;;(require 'company)
;;(add-hook 'after-init-hook 'global-company-mode)

;;(require 'ycmd)
;;(ycmd-setup)
;;(add-hook 'c++-mode-hook 'ycmd-mode)
;;(add-hook 'python-mode-hook 'ycmd-mode)
;;(set-variable 'ycmd-server-command '("python" "/Users/engil/Dev/ycmd/ycmd/__main__.py"))
;;; (set-variable 'ycmd-global-config "/path/to/global_config.py")
;;(require 'company-ycmd)
;;(company-ycmd-setup)
;;(define-key company-active-map [return] 'company-abort)
;;(define-key company-active-map [tab] 'company-complete-selection)
;;(setq company-idle-delay 0.8)


;;(require 'flycheck-ycmd)
;;(flycheck-ycmd-setup)

(evil-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(deftheme ians  "My own Emacs color theme")
(let ((class '((class color) (min-colors 8))))
  (custom-theme-set-faces
   'ians

   ;normal stuff
   `(default ((,class (:background "darkblack"))))
   `(cursor ((,class (:background "green" :forefround "green"))))
   `(fringe ((,class (:background "none" :foreground "green"))))
   ; special stuff
   `(font-lock-builtin-face ((,class (:foreground "green"))))
   `(font-lock-constant-face ((,class (:foreground "cyan"))))
   `(font-lock-keyword-face ((,class (:foreground "brightred"))))
   `(font-lock-string-face ((,class (:foreground "white"))))
   `(font-lock-comment-face ((,class (:foreground "white"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))
   `(font-lock-number-face ((,class (:foreground "red"))))
   `(font-lock-type-face ((,class (:foreground "yellow"))))
   `(font-lock-variable-name-face ((,class (:foreground "yellow"))))
   `(font-lock-function-name-face ((,class (:foreground "green"))))
   `(font-lock-constant-face ((,class (:foreground "yellow"))))
   `(font-lock-warning-face ((,class (:foreground "red"))))))

(provide-theme 'ians)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-to-list 'auto-mode-alist '("\\.eliom\\'" . tuareg-mode))

(add-hook 'go-mode-hook
  (lambda ()
    (setq-default)
    (setq tab-width 2)
    (setq standard-indent 2)
    (setq indent-tabs-mode nil)))

(add-hook 'server-switch-hook
	  (lambda nil
	    (let ((server-buf (current-buffer)))
	      (bury-buffer)
	      (switch-to-buffer-other-frame server-buf))))

(add-hook 'server-done-hook 'delete-frame)
