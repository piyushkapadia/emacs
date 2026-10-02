;;; config.el --- Startup settings for the my-settings layer.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Configure CUA, the menu bar, and Org key compatibility.

;;; Code:

;; Let CUA handle the Shift-arrow keys that Org normally uses.
(defvar org-replace-disputed-keys)
(setq org-replace-disputed-keys t)

(cua-mode 1)
(menu-bar-mode 1)


;;; config.el ends here
