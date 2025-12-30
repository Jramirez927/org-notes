;;; export-calendars.el --- Calendar Export Script -*- lexical-binding: t; -*-
;;
;; Package-Requires: ((emacs "29.1"))
;; Copyright (C) 2025 Jorge Ramirez
;;
;; Author: Jorge Ramirez <jorgeramirez927@gmail.com>
;; Maintainer: Jorge Ramirez <jorgeramirez927@gmail.com>
;; Created: December 28, 2025
;; Modified: December 28, 2025
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/jramirez/export_calendars
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; this is just to export calendars
;;
;;; Code:
;;;
(require 'org)
(require 'ox-icalendar)

(setq org-directory ".")

;; Org agenda over all org files in this project
(setq org-agenda-files
      (directory-files-recursively org-directory "\\.org$"))
      
(setq org-export-with-broken-links t)

(setq org-icalendar-scheduled-summary-prefix "")
(setq org-icalendar-deadline-summary-prefix "")

(defun export-calendars-my-export ()
  (let ((org-icalendar-use-scheduled '(todo-start event-if-todo))
        (org-icalendar-use-deadline nil)
        (org-icalendar-combined-agenda-file  "calendars/scheduled.ics"))
    (org-icalendar-combine-agenda-files))

  (let ((org-icalendar-use-deadline '(event-if-todo event-if-not-todo))
        (org-icalendar-use-scheduled nil)
        (org-icalendar-combined-agenda-file  "calendars/deadline.ics"))
    (org-icalendar-combine-agenda-files)))

(export-calendars-my-export)
(provide 'export-calendars)
;;; export-calendars.el ends here
