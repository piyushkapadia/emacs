;;; packages.el --- Package setup for the my-settings layer.  -*- lexical-binding: t; -*-
;;
;; Copyright (c) 2012-2025 Sylvain Benner & Contributors
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Declare this layer's packages and their initialization functions here.

;;; Code:
(defconst my-settings-packages
  '((centaur-tabs :location local))
  "Packages initialized by the my-settings layer.")

(defun my-settings/init-centaur-tabs ()
  (use-package centaur-tabs
    :config
    (centaur-tabs-headline-match)
    (setq centaur-tabs-style "bar"
          centaur-tabs-height 70
          centaur-tabs-set-icons t
          centaur-tabs-icon-type 'all-the-icons)
    (centaur-tabs-mode 1)))

