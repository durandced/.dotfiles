;; BINDINGS
;;(setq cua-enable-cua-keys nil)
;;(setq cua-highlight-region-shift-only t) ;; no transient mark mode
;;(setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
;;(cua-mode)

;; BINDINGS :: ido
(when has-ido
  (global-set-key [(control b)] 'ido-switch-buffer))

;; BINDINGS :: isearch
(global-set-key [(control f)] 'isearch-forward-regexp)  ; search regexp
(global-set-key [(control r)] 'query-replace-regexp)    ; replace regexp
(define-key
  isearch-mode-map
  [(control n)]
  'isearch-repeat-forward)                              ; next occurence
(define-key
  isearch-mode-map
  [(control p)]
  'isearch-repeat-backward)                             ; previous occurence
(define-key
  isearch-mode-map
  [(control z)]
  'isearch-cancel)                                      ; quit and go back to start point
(define-key
  isearch-mode-map
  [(control f)]
  'isearch-exit)                                        ; abort
(define-key
  isearch-mode-map
  [(control r)]
  'isearch-query-replace)                               ; switch to replace mode
(define-key
  isearch-mode-map
  [S-insert]
  'isearch-yank-kill)                                   ; paste
(define-key
  isearch-mode-map
  [(control e)]
  'isearch-toggle-regexp)                               ; toggle regexp
(define-key
  isearch-mode-map
  [(control l)]
  'isearch-yank-line)                                   ; yank line from buffer
(define-key
  isearch-mode-map
  [(control w)]
  'isearch-yank-word)                                   ; yank word from buffer
(define-key
  isearch-mode-map
  [(control c)]
  'isearch-yank-char)                                   ; yank char from buffer

;; BINDINGS :: C/C++

(global-set-key [(C-M-iso-lefttab)] 'hs-hide-level)       ; fold code
(global-set-key [(C-M-tab)] 'hs-show-all)       ; fold code
(global-set-key [(C-iso-lefttab)] 'hs-hide-block)       ; fold code
(global-set-key [(control tab)] 'hs-show-block)		; unfold code

(require 'cc-mode)

(define-key
  c-mode-base-map
  [(control c) (w)]
  'c-switch-hh-cc)                                      ; switch between .hh and .cc
(define-key
  c-mode-base-map
  [(control c) (control n)]
  'c-insert-ns)                                         ; insert namespace
(define-key
  c-mode-base-map
  [(control c) (control s)]
  'c-insert-switch)                                     ; insert switch
(define-key
  c-mode-base-map
  [(control c) (control i)]
  'c-insert-if)                                         ; insert if
(define-key
  c-mode-base-map
  [(control c) (control b)]
  'c-insert-braces)                                     ; insert braces
(define-key
  c-mode-base-map
  [(control c) (control f)]
  'insert-fixme)                                      ; insert fixme
(define-key
  c-mode-base-map
  [(control c) (control d)]
  'c-insert-debug)                                      ; insert debug
(define-key
  c-mode-base-map
  [(control c) (control l)]
  'c-insert-class)                                      ; insert class

;; ;; BINDINGS :: C/C++ :: XRefactory

;; (define-key
;;   c-mode-base-map
;;   [(control c) (d)]
;;   'xref-push-and-goto-definition)                       ; goto definition
;; (define-key
;;   c-mode-base-map
;;   [(control c) (b)]
;;   'xref-pop-and-return)                                 ; go back
;; (define-key
;;   c-mode-base-map
;;   [C-return]
;;   'xref-completion)                                     ; complete

;; BINDINGS :: misc

(global-set-key [(control q)]  'beginning-of-line)
(global-set-key [(meta =)]
                'count-lines-region)
(if (display-graphic-p)
    (global-set-key [(control z)] 'undo)                ; undo only in graphic mode
)
(global-set-key [(control a)] 'mark-whole-buffer)       ; select whole buffer
(global-set-key [(control x) (control x)] 'ansi-term)       ; select whole buffer
(global-set-key [(control return)] 'string-rectangle)     ; auto completion
(global-set-key [C-home] 'beginning-of-buffer)          ; go to the beginning of buffer
(global-set-key [C-end] 'end-of-buffer)                 ; go to the end of buffer
(global-set-key [(meta g)] 'goto-line)                  ; goto line #
(global-set-key [(control c) (c)] 'recompile)
(global-set-key [(control c) (e)] 'next-error)
;; (global-set-key [(control tab)] 'other-window)          ; Ctrl-Tab = Next buffer
;; (global-set-key [C-S-iso-lefttab]
;;                 '(lambda () (interactive)
;;                    (other-window -1)))                  ; Ctrl-Shift-Tab = Previo
;;us buffer
(global-set-key [(control delete)]
                'kill-word)                             ; kill word forward
(global-set-key [(meta ~)] 'ruby-command)               ; run ruby command

(defun aborn/backward-kill-word ()
  "Customize/Smart backward-kill-word."
  (interactive)
  (let* ((cp (point))
         (backword)
         (end)
         (space-pos)
         (backword-char (if (bobp)
                            ""           ;; cursor in begin of buffer
                          (buffer-substring cp (- cp 1)))))
    (if (equal (length backword-char) (string-width backword-char))
        (progn
          (save-excursion
            (setq backword (buffer-substring (point) (progn (forward-word -1) (point)))))
          (setq ab/debug backword)
          (save-excursion
            (when (and backword          ;; when backword contains space
                       (s-contains? " " backword))
              (setq space-pos (ignore-errors (search-backward " ")))))
          (save-excursion
            (let* ((pos (ignore-errors (search-backward-regexp "\n")))
                   (substr (when pos (buffer-substring pos cp))))
              (when (or (and substr (s-blank? (s-trim substr)))
                        (s-contains? "\n" backword))
                (setq end pos))))
          (if end
              (kill-region cp end)
            (if space-pos
                (kill-region cp space-pos)
              (backward-kill-word 1))))
      (kill-region cp (- cp 1)))         ;; word is non-english word
    ))

(global-set-key  [C-w]
            'aborn/backward-kill-word)

;; make C-Q RET insert a \n, not a ^M

(defadvice insert-and-inherit (before ENCULAY activate)
  (when (eq (car args) ?)
    (setcar args ?\n)))


(provide 'my-shortcuts)
