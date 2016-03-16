# Emacs

Installer cpplint

;;Coding properly in C,C++(use style recommended by Google(will be use in the futur))
; start flymake-google-cpplint-load
; let's define a function for flymake initialization
;(defun my:flymake-google-init () 
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;  (flymake-google-cpplint-load)
;)
;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on Semantic
;(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
;(defun my:add-semantic-to-autocomplete() 
;  (add-to-list 'ac-sources 'ac-source-semantic)
;)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode 
(global-ede-mode 1)
;; create a project for our program.
;;(ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp"
;;		      :include-path '("/../my_inc"))
;; you can use system-include-path for setting up the system header file locations.
;; turn on automatic reparsing of open buffers in semantic
;;(global-semantic-idle-scheduler-mode 1)



Java auto-complete

java Tags.java
