;;; keybindings.el --- General key bindings for my-settings.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Keep package-specific setup in `packages.el'.

;;; Code:

(defvar cua-global-keymap)
(declare-function my-settings-query-replace "funcs" ())

(with-eval-after-load 'cua-base
  ;; Use CUA's global map so major modes cannot shadow these bindings.
  (define-key cua-global-keymap (kbd "C-a") #'mark-whole-buffer)
  (define-key cua-global-keymap (kbd "C-y") #'undo-redo)
  (define-key cua-global-keymap (kbd "C-f") #'isearch-forward))

(global-set-key (kbd "C-c r") #'my-settings-query-replace)

;;; keybindings.el ends here