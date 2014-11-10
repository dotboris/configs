(require 'package)

;; Package mirrors
(add-to-list 'package-archives
	     '("melpa" . "http://stable.melpa.org/packages/"))

;; Init packages
(package-initialize)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/darkula")
(load-theme 'Darkula t)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(global-set-key (kbd "C-SPC") 'auto-complete)

(require 'ac-geiser)
(add-hook 'geiser-mode-hook 'ac-geiser-setup)
(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'geiser-repl-mode))

;; LaTeX
(setq TeX-PDF-mode t)

;; R & stats
(require 'ess-site)

;; Markdown
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Keyboard shortcuts

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-hl-line-mode nil)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 100 :family "Source Code Pro"))))
 '(hl-line ((t (:background "#363636")))))

;; Modes
(setq line-number-moffffde t)
(setq column-number-mode t)
(global-linum-mode t)
(global-hl-line-mode t)
