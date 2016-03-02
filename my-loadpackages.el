; ~/.emacs.d/my-loadpackages.el
; loading package
(load "~/.emacs.d/my-packages.el")

;;Use-package(gestion of the packages in Emacs)
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;Yasnippet
(use-package yasnippet
:init
(add-hook 'term-mode-hook (lambda()
(setq yas-dont-activate t)))
:config
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets"))

;;Latex-previrew-pane
;;(use-package latex-preview-pane
  ;;:init
  ;;(setq text-mode-hook '(lambda() (flyspell-mode t) ))
  ;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
  ;;(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode))

;;CDLatex
(use-package cdlatex
  :init
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook 'LaTeX-mode-hook 'cdlatex-mode))

;;Auctex

;; Basic settings
(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init
  (progn
    (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)
    (add-hook 'LaTeX-mode-hook #'flyspell-mode)
    (add-hook 'LaTeX-mode-hook #'turn-on-reftex)
    (setq TeX-auto-save t
	  TeX-parse-self t
	  TeX-save-query nil
	  TeX-PDF-mode t)
    (setq-default TeX-master nil)))

(use-package preview
  :commands LaTeX-preview-setup
  :init
  (progn
    (setq-default preview-scale 1.4
		  preview-scale-function '(lambda () (* (/ 10.0 (preview-document-pt)) preview-scale)))))

(use-package reftex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t)))

(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (progn
    (setq bibtex-align-at-equal-sign t)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))


;; Auto-fill for LaTeX
(defun schnouki/latex-auto-fill ()
  "Turn on auto-fill for LaTeX mode."
  (turn-on-auto-fill)
  (set-fill-column 80)
  (setq default-justification 'left))
(add-hook 'LaTeX-mode-hook #'schnouki/latex-auto-fill)

;; Compilation command
(add-hook 'LaTeX-mode-hook (lambda () (setq compile-command "latexmk -pdf")))

