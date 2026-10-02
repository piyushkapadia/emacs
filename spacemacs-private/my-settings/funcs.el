;;; funcs.el --- Interactive helpers for the my-settings layer.  -*- lexical-binding: t; -*-

;;; Commentary:

;; Search and replace helpers used by this layer's key bindings.

;;; Code:

(defun my-settings-query-replace ()
  "Prompt for search options, then query-replace matching text."
  (interactive)
  (let* ((origin (point))
         (region (when (use-region-p)
                   (cons (region-beginning) (region-end))))
         (search (read-string "Search for: "))
         (replacement (read-string "Replace with: "))
         (pattern-type
          (completing-read "Pattern: " '("Plain text" "Regular expression")
                           nil t nil nil "Plain text"))
         (case-mode
          (completing-read "Case: " '("Ignore case" "Case sensitive")
                           nil t nil nil "Ignore case"))
         (whole-word (y-or-n-p "Whole word only? "))
         (scope-options
          (if region
              '("Selection" "Forward from point" "Entire buffer")
            '("Forward from point" "Entire buffer")))
         (scope
          (completing-read "Search scope: " scope-options nil t nil nil
                           (if region "Selection" "Forward from point")))
         (start (pcase scope
                  ("Selection" (car region))
                  ("Forward from point" origin)
                  (_ (point-min))))
         (end (if (equal scope "Selection") (cdr region) (point-max)))
         (regexp-p (equal pattern-type "Regular expression"))
         (case-fold-search (equal case-mode "Ignore case"))
         ;; Disable Emacs's uppercase-query exception for explicit ignore-case.
         (search-upper-case nil)
         (replace-function
          (if regexp-p #'query-replace-regexp #'query-replace)))
    (when (equal search "")
      (user-error "Search text cannot be empty"))
    (if (equal scope "Entire buffer")
        (save-restriction
          (widen)
          (funcall replace-function search replacement whole-word
                   (point-min) (point-max)))
      (funcall replace-function search replacement whole-word start end))))

;;; funcs.el ends here