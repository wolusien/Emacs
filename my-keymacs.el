; ~/.emacs.d/my-keymacs.el


;;Indentation
(setq-default indent-tabs-mode nil)  ; use only spaces and no tabs
(setq tab-width 2) ; or any other preferred value

;; Affiche le numéro de ligne et de colonne
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; Les 'beep' deviennent visibles (et non plus audibles)
(setq visible-bell t)

;; Activer la coloration syntaxique
(global-font-lock-mode t)

;; Afficher la 'parenthèse correspondante'
(require 'paren)
(show-paren-mode)

;; Raccouris clavier
(global-set-key [(control z)] 'undo)

;;Use delete-selection mode
(setq delete-selection-mode t)

;; activation de la molette souris
(mouse-wheel-mode)

;;Make parenthesis work as a pair
(electric-pair-mode 1)

(set-language-environment "UTF-8")
;;Permet de gérer les ê
(load-library "iso-transl")
;;Dictionnaire français
(setq ispell-dictionary "francais")
