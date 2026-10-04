;;; config.el --- Startup settings for the my-settings layer.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Configure CUA, the menu bar, and Org key compatibility.

;;; Code:

(defvar evil-collection-binding-overrides nil)

(defconst my-settings-msys2-bin "D:/Dev/Tools/msys64/usr/bin"
  "MSYS2 directory containing GNU utilities used by Emacs subprocesses.")

(when (file-directory-p my-settings-msys2-bin)
  (setq exec-path (cons my-settings-msys2-bin
                        (delete my-settings-msys2-bin exec-path)))
  (setenv "PATH" (concat my-settings-msys2-bin path-separator (getenv "PATH"))))

;; Let CUA handle the Shift-arrow keys that Org normally uses.
(defvar org-replace-disputed-keys)
(setq org-replace-disputed-keys t)

(cua-mode 1)
(menu-bar-mode 1)

(add-to-list 'load-path
	     (expand-file-name "../local/dired+"
			       (file-name-directory (or load-file-name buffer-file-name))))

(with-eval-after-load 'ls-lisp
	(setq ls-lisp-dirs-first t
	      ls-lisp-use-insert-directory-program t
	      insert-directory-program (expand-file-name "ls.exe" my-settings-msys2-bin)))

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(with-eval-after-load 'dired
	(load "dired+" nil 'nomessage)
	(define-key dired-mode-map (kbd "C-k") #'dired-do-kill-lines))

;;; config.el ends here
