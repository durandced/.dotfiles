(setq tramp-default-method "scp")
(setq tramp-verbose 10)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;;(add-to-list 'tramp-connection-properties
;;             (list ".*" "locale" "LC_ALL=C"))
;;(setq tramp-shell-prompt-pattern  "   \\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")

(provide 'my-ssh)
