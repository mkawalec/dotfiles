(require 'package)
(require 'cl)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmelade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'load-path "~/build/neotree")
(setq farmhouse-path "~/build/emacs-farmhouse-theme")
(add-to-list 'custom-theme-load-path farmhouse-path)
(add-to-list 'custom-theme-load-path "~/build/emacs-leuven-theme")
(add-to-list 'load-path farmhouse-path)


;; Activate installed packages
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
      helm
      evil
      neotree
      web-mode
      js2-mode
      auto-complete
      powerline
      powerline-evil
      highlight
      evil-search-highlight-persist
      moe-theme
))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-light)
(moe-theme-set-color 'red)
(powerline-moe-theme)
(setq calendar-latitude +34)
(setq calendar-longitude -118)
(require 'moe-theme-switcher)

(global-set-key [f8] 'neotree-toggle)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

(eval-after-load "haskell-mode"
  '(progn
    (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
    (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

(require 'recentf)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c C-y") 'clipboard-yank)

(global-set-key (kbd "M-1") 'helm-buffers-list)

(require 'highlight)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(setq evil-search-highlight-string-min-len 3)

(evil-mode t)
(helm-mode 1)
(recentf-mode 1)
(powerline-default-theme)

(setq linum-format "%d ")

(tool-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode 1)
(scroll-bar-mode 0)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq show-paren-style 'expression)
(ac-config-default)
(auto-complete-mode 1)

(column-number-mode 1)
(show-paren-mode 1)
(desktop-save-mode 1)
(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil
  :family "Menlo" :height 130 :weight 'normal)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7443af2f858246a37abc42ec0d32c658c3dcba34c2b26741abc81070c087ad14" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
