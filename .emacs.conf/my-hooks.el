;; HOOKS

; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
	      (insert-header-guard)
	      (goto-line 3)
	      (insert "\n"))))
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.cc?" (buffer-file-name)))
	      (insert-header-inclusion))))

(add-hook 'sh-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/bin/bash")))

(add-hook 'ruby-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/usr/bin/ruby")))


; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))
(add-hook 'dts-mode (lambda () (hs-minor-mode 1)))

;; file extensions
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.yy$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xcc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xhh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ; Qt .pro files
(add-to-list 'auto-mode-alist '("configure$" . sh-mode))
(add-to-list 'auto-mode-alist '("Drakefile$" . c++-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . change-log-mode))

(provide 'my-hooks)
