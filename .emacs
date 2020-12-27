;;; Emacs --- Configuration
;;; Commentary:
;; Loosely based on mefylś conf https://github.com/mefyl/emacs-config

;; MELPA packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(require 'helm)
(require 'helm-config)
(require 'multiple-cursors)
(require 'tramp)

;; My own packages
(defun may-load (path)
  "Load a file iff it exists."
  (when (file-readable-p path)
    (load-file path)))

(defconst conf-dir "~/.emacs.conf/"
  "Location of the configuration files")
(add-to-list 'load-path conf-dir)

(require 'dts-mode)
(require 'fold-dwim)
(require 'my-autoload)
(require 'my-cmake-mode)
(require 'my-c-mode)
(require 'my-custom-funcs)
(require 'my-elisp)
(require 'my-fixme)
(require 'my-flycheck)
(require 'my-font)
(require 'my-gnuserv) ;; todo
(require 'my-helm) ;; todo
(require 'my-hooks)
(require 'my-ido)
(require 'my-layout)
(require 'my-lisp-mode)
(require 'my-magit)
(require 'my-markdown)
(require 'my-multiple-cursors)
(require 'my-options)
(require 'my-python-mode)
(require 'my-shortcuts)
(require 'my-ssh)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(gdb-max-frames 1024)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-ignore-buffers
   (quote
    ("\\`\\*breakpoints of.*\\*\\'" "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'" "\\`\\*locals of.*\\*\\'" "\\` ")))
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages
   (quote
    (helm-descbinds diffview markdown-preview-eww markdown-preview-mode markdown-mode flycheck-tip diff-hl flx-ido projectile ibuffer-vc expand-region company undo-propose use-package smartparens volatile-highlights flycheck multiple-cursors helm-gtags cmake-mode)))
 '(python-guess-indent nil)
 '(python-indent 2)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((((background dark)) (:foreground "DarkSlateGrey")) (t (:foreground "DarkGreen"))))
 '(diff-changed ((((background dark)) (:foreground "Yellow")) (t (:foreground "MediumBlue"))))
 '(diff-context ((((background dark)) (:foreground "LightSlateGrey")) (t (:foreground "Red"))))
 '(diff-file-header ((((background dark)) (:foreground "Cyan" :background "Black")) (t (:foreground "Red" :background "White"))))
 '(diff-header ((((background dark)) (:foreground "Cyan")) (t (:foreground "Red"))))
 '(diff-hunk-header ((((background dark)) (:foreground "Black" :background "#05057F7F8D8D")) (t (:foreground "White" :background "Salmon"))))
 '(diff-index ((((background dark)) (:foreground "Magenta")) (t (:foreground "Green"))))
 '(diff-nonexistent ((((background dark)) (:foreground "#FFFFFFFF7474")) (t (:foreground "DarkBlue"))))
 '(diff-removed ((((background dark)) (:foreground "#FFFF9B9BFFFF")) (t (:foreground "DarkMagenta"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 16)) nil)))
 '(font-lock-comment-face ((t (:foreground "red3"))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue3")))))
