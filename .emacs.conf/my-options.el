;; OPTIONS

(setq inhibit-startup-message t)        ; don't show the GNU splash screen
(setq frame-title-format "%b")          ; titlebar shows buffer's name
(global-font-lock-mode t)               ; syntax highlighting
(setq font-lock-maximum-decoration t)   ; max decoration for all modes
;(setq transient-mark-mode 't)          ; highlight selection
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(when (display-graphic-p)
  (progn
    (scroll-bar-mode -1)                ; no scroll bar
    (menu-bar-mode -1)                  ; no menu bar
    (tool-bar-mode -1)                  ; no tool bar
    (mouse-wheel-mode t)))              ; enable mouse wheel

(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile

;; FIXME: wanted 99.9% of the time, but can cause your death 0.1% of
;; the time =). Todo: save buffer before reverting
;(global-auto-revert-mode t)            ; auto revert modified files

;(pc-selection-mode)                    ; selection with shift
(auto-image-file-mode)                  ; to see picture in emacs
(dynamic-completion-mode)              ; dynamic completion
(show-paren-mode t)			; match parenthesis

;; GDB
(setq-default gdb-many-windows t)


(provide 'my-options)
