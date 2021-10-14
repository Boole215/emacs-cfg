(package-initialize)
(require 'package)
(add-to-list 'package-archives ' ("melpa" . "https://melpa.org/packages/") t)

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package)))

(use-package popwin
	     :ensure t)


(require 'popwin)
(popwin-mode 1)

;(require 'direx)
;(push '(direx:direx-mode :position left :width 25 :dedicated t)
;      popwin:special-display-config)
;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

					; Enable treemacs (sorry direx)
(use-package treemacs
  :init (setq treemacs-show-hidden-files nil)
  :hook (after-init . #'treemacs-find-file)
  :config (treemacs-git-mode 'extended))
(global-set-key (kbd "C-x C-j") 'treemacs)
(treemacs-define-doubleclick-action 'file-node-open   #'treemacs-visit-node-in-most-recently-used-window)
(treemacs-define-doubleclick-action 'file-node-closed #'treemacs-visit-node-in-most-recently-used-window)

; enable mouse in console
(xterm-mouse-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

;enables arist mode
;For some reason doesn't work... Look it up?
;(autoload artist-mode "artist" "Enter artist-mode" t)
;autopair
(require 'autopair)
(autopair-global-mode)
;diff-hl
(global-diff-hl-mode)
(require 'org)
(setq org-hide-emphasis-markers t)

; Time on every bar
(display-time-mode 1)

; zone when afk for a while
(require 'zone)
(zone-when-idle 600)

(setq org-hide-leading-stars t)

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

; enable Sublimity smooth scrolling and minimap
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-attractive
	 )
(setq sublimity-scroll-weight 4
      sublimity-scroll-drift-length 0)
(setq sublimity-attractive-centering-width nil)
(sublimity-attractive-hide-vertical-border)



(sublimity-mode 1)

; Set C programming mode
(setq c-default-style "linux"
      c-basic-offset 4)

; Enable rust-mode
(require 'rust-mode)

;(find-file "C:/Users/Andrew/Documents/orgnotes/projectIdeas.org")
;(split-window-right)
;(find-file-other-window "C:/Users/Andrew/Documents/orgnotes/leetcode.org")
(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

; Automatically refreshes buffer on underlying file changes (whenever)
(global-auto-revert-mode)

;e-shell usability
(make-comint-in-buffer "cmd" nil "cmd" nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(wilson))
 '(custom-safe-themes
   '("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "41b185f016ba6ed8d6f6cc15864b06d444169db601302787548587781ced817f" default))
 '(fringe-mode '(5 . 0) nil (fringe))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(linum-format " %7i ")
 '(menu-bar-mode nil)
 '(org-hide-leading-stars t)
 '(org-support-shift-select t)
 '(package-selected-packages
   '(sublimity rust-mode xref dumb-jump treemacs-all-the-icons treemacs-magit treemacs use-package diff-hl sublime-themes ssh popwin minimap direx autopair))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "SystemWindowText" :font "Verdana")))))

; Variables to remove UI elements
