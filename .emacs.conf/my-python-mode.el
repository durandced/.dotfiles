(custom-set-variables
 '(python-indent 2))

(defun python-mode-setup ()

  ;; ------------- ;;
  ;; CONFIGURATION ;;
  ;; ------------- ;;

  ;; Comment boxing style
  (set 'my-rebox-style 423)

  ;; -------- ;;
  ;; BINDINGS ;;
  ;; -------- ;;

  ;; comment
  (define-key
    py-mode-map
    [(control c) (control c)]
    'comment-region)

  ;; rebox
  (define-key
    py-mode-map
    [(meta q)]
    'my-rebox-comment)

)

(add-hook 'python-mode-hook 'python-mode-setup)

;; python config
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))

(provide 'my-python-mode)
