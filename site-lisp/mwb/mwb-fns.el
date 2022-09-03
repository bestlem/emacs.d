;;; mwb-fns ---  Various functions I need  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <emacs@bestley.co.uk>
;; Created: 27 Aug 2021
;; Version: 0.1
;; Package-Requires: (dependencies)

;; Keywords: keywords

;; X-URL: https://github.com/bestlem/mwb-fns

;; This file is not part of GNU Emacs

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:

(defgroup mwb-fns nil
  "Various functions I need."
  :group 'mwb)

(defun mwb-mapcar* (func arglist)
  "Apply function FUNC to all elements in ARGLIST.
Each element is a list of the arguments to FUNC.
Taken from https://emacs.stackexchange.com/a/55111/9874"
  (mapcar
   (lambda (args)
     (apply func args))
   arglist))

(provide 'mwb-fns)

;;; mwb-fns.el ends here
