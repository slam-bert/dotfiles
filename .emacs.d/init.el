(setq inhibit-startup-message t)	;; Disable startup message
(scroll-bar-mode -1)			;; Disable visible scrollbar
(tool-bar-mode -1)			;; Disable the toolbar
(tooltip-mode -1)			;; Disable tooltips
(set-fringe-mode 10)			;; Gives some breathing room for GUI
(menu-bar-mode -1)			;; Disable the menu bar
(setq visible-bell t)			;; Set up the visible bell
(global-display-line-numbers-mode)       ;; Display line numbers
(set-face-attribute 'default nil :font "-xos4-terminus-medium-r-normal--16-160-72-72-c-80-iso8859-1")  ;; Set font to the Terminus font
(require 'package) ;; Lets the fun begin (Packages/Plugins)
;; Adds repos to get packges from
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
             '("elpa" . "https://elpa.gnu.org/packages/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(mood-line smart-cursor-color all-the-icons dashboard rainbow-mode evil doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; enables evil
(require 'evil)
(evil-mode 1)
;; enables all-the-icons, required for doom-modeline to work correctly
(require 'all-the-icons)
;; modeline config
;(setq mode-line-format
;      (list
;       ;; name of major mode
;       "%m: "
;       ;; buffer name
;       "buffer %b, "
;       ;; line number
;       "line %l "
;       "-- user: "
;       ;; user login name/ID
;       (getenv "USER")))
;; smart-cursor-color config
;; enable mood-line
(require 'mood-line)
(mood-line-mode 1)
(require 'smart-cursor-color)
(smart-cursor-color-mode 1)
;; rainbow-mode config
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 )
;; doom-themes config
(require 'doom-themes)
(load-theme 'doom-solarized-dark t)
(doom-themes-visual-bell-config)
;; dashboard config
(require 'dashboard)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-banner-logo-title "Welcome Back, Brandon!")
(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
(setq dashboard-center-content t) ;; set to 't' for centered content
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
(dashboard-setup-startup-hook)
