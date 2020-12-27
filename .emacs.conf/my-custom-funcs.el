;; CUSTOM FUNCTIONS

;; Reload conf
(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

;; Compilation
(defvar cpu-number 8
  "Number of parallel processing units on this system")

(setq compile-command "")
(setq compilation-skip-threshold 2)

;; Shebangs
(defun insert-shebang (bin)
  (interactive "sBin: ")
  (save-excursion
    (goto-char (point-min))
    (insert "#!" bin "\n\n")))
(defun insert-shebang-if-empty (bin)
  (when (buffer-empty-p)
    (insert-shebang bin)))

;; C/C++

;; Comment boxing
(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
        (let*
            ((name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name)))))
          (goto-char (point-min))
         (insert "#ifndef " macro "\n")
          (insert "# define " macro "\n\n")
          (goto-char (point-max))
          (insert "\n#endif\n")))))
(defun insert-header-inclusion ()
  (interactive)
  (when (buffer-file-name)
    (let
        ((name
          (replace-regexp-in-string ".c$" ".h"
            (replace-regexp-in-string ".cc$" ".hh"
              (file-name-nondirectory buffer-file-name)))))
      (insert "#include \"" name "\"\n\n"))))


(defun sandbox ()
  "Opens a C++ sandbox in current window."
  (interactive)
  (cd "/tmp")
  (let ((file (make-temp-file "/tmp/" nil ".cc")))
    (find-file file)
    (insert "int main()\n{\n\n}\n")
    (line-move -2)
    (save-buffer)
    (compile (concat "g++ -W -Wall -I /usr/include/qt4/ -I /usr/include/qt4/QtCore/ -L /usr/lib/qt4 -lQtCore " file " && ./a.out"))))

(defun c-insert-debug (&optional msg)
  (interactive)
  (when (not (looking-at "\\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "std::cerr << \"\" << std::endl;")
  (backward-char 15))

(defun c-insert-block (&optional r b a)
  (interactive "P")
  (unless b (setq b ""))
  (unless a (setq a ""))
  (if r
      (progn
        (save-excursion
          (goto-char (rbegin))
          (beginning-of-line)
          (insert "\n")
          (line-move -1)
          (insert b "{")
          (c-indent-line))
        (save-excursion
          (goto-char (- (rend) 1))
          (end-of-line)
          (insert "\n}" a)
          (c-indent-line)
          (line-move -1)
          (end-of-line))
        (indent-region (rbegin) (rend)))
    (progn
        (beginning-of-line)

        (setq begin (point))

        (insert b "{\n")
        (end-of-line)
        (insert "\n}" a)

        (indent-region begin (point))

        (line-move -1)
        (end-of-line))))

(defun c-insert-braces (&optional r)
  (interactive "P")
  (c-insert-block r))

(defun c-insert-ns (name r)
  (interactive "sName: \nP")
  (c-insert-block r (concat "namespace " name "\n")))

(defun c-insert-switch (value r)
  (interactive "sValue: \nP")
  (c-insert-block r (concat "switch (" value ")\n")))

(defun c-insert-if (c r)
  (interactive "sCondition: \nP")
  (c-insert-block r (concat "if (" c ")\n")))

(defun c-insert-class (name)
  (interactive "sName: ")
  (c-insert-block () (concat "class " name "\n") ";")
  (insert "public:")
  (c-indent-line)
  (insert "\n")
  (c-indent-line))

(provide 'my-custom-funcs)
