;; load packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; el-get default load path
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; load el-get or downlaod it
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; recipies checked out from github
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")

;; local rules
(setq el-get-sources
      '((:name darkula-theme
	       :description "IntelliJ IDEA's Darkula theme"
	       :type github
	       :pkgname "bmdhacks/emacs-color-theme-darkula"
	       :prepare (progn
			  (add-to-list 'custom-theme-load-path default-directory)))
	
	;; package specific settings
	;; these will be loaded only if a package is installed
	;; using this will make the config file as portable as possible
	(:name auctex
	       :after (progn
			(setq TeX-PDF-mode t)
			(setq TeX-auto-save t)
			(setq TeX-parse-self t)

			(add-hook 'TeX-mode-hook
				  (lambda ()
				    (define-key TeX-mode-map (kbd "C-SPC") 'TeX-complete-symbol)
				    (add-to-list 'TeX-command-list
						 '("xelatexmk"
						   "latexmk --xelatex --interaction=nonstopmode"
						   TeX-run-command t t :help "Run latexmk with xelatex"))
                                    (add-to-list 'TeX-command-list
						 '("lualatexmk"
						   "latexmk --lualatex --interaction=nonstopmode"
						   TeX-run-command t t :help "Run latexmk with lualatex"))
				    (setq TeX-command-default "lualatexmk")))))
	(:name projectile
	       :after (progn
			(projectile-global-mode)
			(global-set-key (kbd "C-S-o") 'projectile-find-file)
			
			(require 'helm-projectile)
			(setq projectile-completion-system 'helm)
			(helm-projectile-on)))
	(:name helm
	       :after (progn
			(require 'helm-config)
			(helm-mode 1)
			(global-set-key (kbd "C-o") 'helm-find-files)))
	
	(:name auto-complete
	       :after (progn
			(require 'auto-complete-config)
			(ac-config-default)
			(global-set-key (kbd "C-SPC") 'auto-complete)))
	(:name yasnippet
	       :after (progn
			(add-to-list 'ac-sources 'ac-source-yasnippet)
			(yas-global-mode 1)))
	(:name ac-geiser
	       :after (progn
			(add-hook 'geiser-mode-hook 'ac-geiser-setup)
			(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
			(eval-after-load "auto-complete"
			  '(add-to-list 'ac-modes 'geiser-repl-mode))))
	(:name magit
	       :after (progn
			(global-set-key (kbd "C-k") 'magit-status)))
	(:name drag-stuff
	       :after (progn
			(drag-stuff-global-mode t)))
	(:name expand-region
	       :after (progn
			(global-set-key (kbd "C-w") 'er/expand-region)))
	(:name smartparens
	       :after (progn
			(require 'smartparens)
			(add-to-list 'sp--lisp-modes 'geiser-mode)
			(add-to-list 'sp--lisp-modes 'geiser-repl-mode)
			(require 'smartparens-config)
			(smartparens-global-mode t)
			(setq sp-highlight-pair-overlay nil)
			(setq sp-autoescape-string-quote nil)))
	(:name slime
	       :after (progn
			;; I don't pick a default lisp implementation because
			;; I don't use lisp enought to have a preference
			(defun slime-use-ccl ()
			    "Use ccl as the interpreter for slime. (`/usr/bin/ccl')"
			    (interactive)
			    (setq inferior-lisp-program "/usr/bin/ccl"))
			(setq slime-contribs '(slime-fancy))))
	(:name irony-mode
	       :after (progn
			(add-hook 'c++-mode-hook 'irony-mode)
			(add-hook 'c-mode-hook 'irony-mode)
			(add-hook 'objc-mode-hook 'irony-mode)))
	(:name ac-irony
	       :after (progn
			(defun my-ac-irony-setup ()
			  (yas-minor-mode 1)
			  (auto-complete-mode 1)

			  (add-to-list 'ac-sources 'ac-source-irony)
			  (define-key irony-mode-map (kbd "C-SPC") 'ac-complete-irony-async))

			(add-hook 'irony-mode-hook 'my-ac-irony-setup)))
        (:name pddl-mode
               :after (progn
                        (require 'pddl-mode)
                        (add-to-list 'auto-mode-alist '("\\.pddl\\'" . PDDL-mode))))
	))

;; packages
(setq packages:essentials
      '(el-get

	helm
	projectile
	
	auto-complete
	yasnippet

	drag-stuff
	smartparens
	expand-region
	
	magit

	darkula-theme))

(setq packages:basic-modes
      '(lua-mode
	markdown-mode))

(setq packages:latex
      '(auctex))

(setq packages:scheme
      '(geiser
	ac-geiser))

(setq packages:lisp
      '(slime))

(setq packages:statictics
      '(ess))

(setq packages:cpp
      '(cmake-mode
	irony-mode
	ac-irony))

(setq packages:scala
      '(scala-mode2
	sbt-mode))

;; odd modes and packages for very specific uses
(setq packages:misc
      '(pddl-mode))

;; install packages (edit to your requirements)
(el-get 'sync
	packages:essentials
	packages:basic-modes
	packages:cpp
	packages:scala
	packages:latex
	packages:scheme
	packages:lisp
	packages:statictics
        packages:misc
	)

;; text manipulation functions
(defun duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun join-next-line ()
  (interactive)
  (delete-indentation 1))

(defun newline-anywhere ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

;; intellij-like key bindings
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-j") 'join-next-line)
(global-set-key (kbd "C-S-c") 'kill-ring-save)
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key (kbd "S-<return>") 'newline-anywhere)
(global-set-key (kbd "<escape>") 'keyboard-quit)

;; tabs and the like
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; customize autogenerated stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-hl-line-mode nil)
 '(inhibit-startup-screen t)
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

;; Theme
(load-theme 'Darkula t)

;; Modes
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)
(global-hl-line-mode t)
(show-paren-mode t)
(pending-delete-mode t)
