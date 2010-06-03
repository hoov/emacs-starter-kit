(eval-after-load 'python-mode
  '(progn
     (define-key map (kbd "RET") 'reindent-then-newline-and-indent)))
     
(defun set-newline-and-indent ()
    (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'python-mode-hook 'run-coding-hook)
(add-hook 'python-mode-hook 'idle-highlight)
(add-hook 'python-mode-hook 'set-newline-and-indent)

(provide 'starter-kit-python)