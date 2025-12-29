;;; org-notes-config.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 jramirez
;;
;; Author: jramirez <jramirez@jrLaptop>
;; Maintainer: jramirez <jramirez@jrLaptop>
;; Created: November 29, 2025
;; Modified: November 29, 2025
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex text tools unix vc wp
;; Homepage: https://github.com/jramirez/org-notes-config
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:




;; Optional: derive org-directory from this project root.
;; If you already set org-directory in $DOOMDIR/config.el, you can skip this.
(setq org-directory (file-name-as-directory
                     (expand-file-name "." default-directory)))

;; Org agenda over all org files in this project
(setq org-agenda-files
      (directory-files-recursively org-directory "\\.org$"))

;; Org-roam base directory
(after! org-roam
  (setq org-roam-directory org-directory)

  ;; Org-roam capture templates
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "00_INBX/${slug}.org"
                              "#+title: ${title}\n")
           :unnarrowed t))

        ;; Roam dailies
        org-roam-dailies-directory "journals/"
        org-roam-dailies-capture-templates
        '(("d" "default" entry "* %?"
           :if-new (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%a - %b %d>\n")))))

;; Org capture templates
(after! org
  (setq org-capture-templates
        '(("t" "Todos Entries")
          ("tt" "Todo" entry
           (file+headline "00_INBX/inbox.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("td" "Daily Todo" entry
           (file+olp+datetree "02_AREA/journal.org")
           "* [ ] %?\n  %i\n  %a")

          ("j" "Jornal Entries")
          ("jj" "Entry" entry
           (file+olp+datetree "02_AREA/journal.org")
           "* %U %?\n" :prepend t)
          ("ji" "Link" entry
           (file+olp+datetree "02_AREA/journal.org")
           "* %U %?\n%i\n%a" :prepend t)

          ("jf" "Log Food" entry
           (file+olp+datetree "02_AREA/food_log.org")
           "* %U %?\n" :prepend t))))

(provide 'org-notes-config)
;;; org-notes-config.el -*- lexical-binding: t; -*-
;;; org-notes-config.el ends here
