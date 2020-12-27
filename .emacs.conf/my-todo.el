;; https://github.com/purcell/mmm-mode


;; ;; mmm mode

;; ;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mmm-mode/")
;; ;; (require 'mmm-mode)
;; ;; (setq mmm-global-mode 'maybe)

;; ;; (defun foo ()
;; ;;   (when (looking-back "^[ \t]*")
;; ;;     (beginning-of-line)))

;; ;; (mmm-add-classes
;; ;;  '((cc-html
;; ;;     :submode html-mode
;; ;;     :face mmm-code-submode-face
;; ;;     :front "\\('@\\|'@xml\\)\n?"
;; ;;     :back "@'"
;; ;;     :back-offset (foo))))


;; ;; (mmm-add-classes
;; ;;  '((ml-ext
;; ;;     :submode text-mode
;; ;;     :face mmm-code-submode-face
;; ;;     :front "<:\\w*<"
;; ;;     :back ">>"
;; ;;     :back-offset (foo))))


;; ;; (mmm-add-mode-ext-class 'c++-mode () 'cc-html)
;; ;;(mmm-add-mode-ext-class 'tuareg-mode () 'ml-ext)

;; ;; (setq mmm-submode-decoration-level 1)

;; ;; (set-face-background 'mmm-default-submode-face "gray16")






;; (semantic-mode 1)
;; (require 'stickyfunc-enhance)
;; (global-semantic-idle-summary-mode 1)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; ;; Save and restore window layout

;; (defvar winconf-ring ())

;; (defun push-winconf ()
;;   (interactive)
;;   (window-configuration-to-register ?%)
;;   (push (get-register ?%) winconf-ring))

;; (defun pop-winconf ()
;;   (interactive)
;;   (set-register ?% (pop winconf-ring))
;;   (jump-to-register ?%))

;; (defun restore-winconf ()
;;   (interactive)
;;   (set-register ?% (car winconf-ring))
;;   (jump-to-register ?%))
