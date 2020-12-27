;; Ido
(defconst has-ido (>= emacs-major-version 22))

(when has-ido
  (ido-mode t)
  ;; Don't switch to GDB-mode buffers
  (add-to-list 'ido-ignore-buffers "locals"))

(when has-ido
  (custom-set-variables
   '(ido-auto-merge-work-directories-length -1)
   '(ido-confirm-unique-completion t)
   '(ido-create-new-buffer (quote always))
   '(ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'" "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'" "\\`\\*locals of.*\\*\\'" "\\` ")))
   '(ido-mode (quote both) nil (ido))))

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
 '(python-guess-indent nil)
 '(python-indent 2)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4))

;; flymake-shellcheck counsel-tramp ssh-agency pylint cmake-mode protobuf-mode elpy ssh auto-sudoedit tramp-term tramp tldr multi-term dired-toggle-sudo hydra multiple-cursors magit-svn magit dsvn diff-hl anything-tramp sr-speedbar stickyfunc-enhance function-args helm-gtags helm-descbinds imenu-anywhere imenu+ ack helm cl-lib cl-generic

(provide 'my-ido)
