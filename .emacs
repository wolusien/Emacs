(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-language-environment "UTF-8")

;;Configuration sources
(load "~/.emacs.d/my-loadpackages.el")
(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/my-keymacs.el")
))

;;Themes sources
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 
;;Load theme
;;(load-theme 'monokai t)

