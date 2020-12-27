;; Multiple Cursors`
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-w") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-s") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-S-w") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-M-S-s") 'mc/unmark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(provide 'my-multiple-cursors)
