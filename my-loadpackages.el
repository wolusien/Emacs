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
;;(yas-load-directory "~/.emacs.d/snippets"))
)

;;Code folding(Reduction de code ou de fonction avec + et -)
(autoload 'hideshowvis-minor-mode
   "hideshowvis"
   "Will indicate regions foldable with hideshow in the fringe."
   'interactive)
   (dolist (hook (list 'emacs-lisp-mode-hook
                     'c++-mode-hook
		     'python-mode-hook
		     'c-mode-common-hook
		     'java-mode-hook
		     'lisp-mode-hook
		     'perl-mode-hook
		     'sh-mode-hook))
   (add-hook hook 'hideshowvis-enable))
(require 'hideshowvis)
(load-library "hideshow")
(hideshowvis-symbols)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

;;Indent guide
(load "~/.emacs.d/indent-guide.el")
(use-package indent-guide 
  :config 
  (indent-guide-global-mode)
  (set-face-background 'indent-guide-face "dimblack")
  (setq indent-guide-recursive t)
  (setq indent-guide-char "|")
)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Latex


;;Latex-previrew-pane
(use-package latex-preview-pane
  :init
  (setq text-mode-hook '(lambda() (flyspell-mode t) ))
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode))



;;CDLatex
(use-package cdlatex
  :init
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook 'LaTeX-mode-hook 'cdlatex-mode))

	
;;LaTex math mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;C,C++ configuration

(global-auto-complete-mode t)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; ; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../x86_64-linux-gnu/include")
;; )
;; ; now let's call this function from c/c++ hooks
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; ; turn on Semantic
(semantic-mode 1)
;; ;let's define a function which adds semantic as a suggestion backend to auto complete
;; ; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
(add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Java

(add-to-list 'load-path "~/.emacs.d/ajc-java-complete/")
(require 'ajc-java-complete-config)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Python configuration

;;Enable flyspell (show the errors)
(require 'python)
(add-hook 'python-mode-hook 'flyspell-prog-mode)
