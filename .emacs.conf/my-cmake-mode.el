; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

;(autoload 'cmake-mode "~/CMake/Auxiliary/cmake-mode.el" t)
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/cmake-mode-20201217.1410/cmake-mode.el") load-path))
;;(require 'cmake-mode)

(provide 'my-cmake-mode)
