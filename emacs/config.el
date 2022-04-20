;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Doug James")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;; Add to ~/.doom.d/config.el
(setq doom-font (font-spec :family "Input Mono Narrow" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Input Mono Narrow" :size 12)
      doom-big-font (font-spec :family "Fira Mono" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; GTD
(after! org
  (setq org-directory "~/Documents/org/")

  (setq org-agenda-files (list "inbox.org" "agenda.org" "notes.org"))

  (setq org-capture-templates
      `(("i" "Inbox" entry  (file "inbox.org")
         ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))
        ("m" "Meeting" entry (file+headline "agenda.org" "Future")
         ,(concat "* %? :meeting:\n"
                  "<%<%Y-%m-%d %a %H:%M>>"))
        ("n" "Note" entry (file "notes.org")
         ,(concat "* Note (%a)\n"
                  "/Entered on/ %U\n" "\n" "%?"))
        ("@" "Inbox [mu4e]" entry (file "inbox.org")
         ,(concat "* TODO Process \"%a\" %?\n"
                 "/Entered on/ %U"))
        ))

  (defun org-capture-inbox ()
    (interactive)
    (call-interactively 'org-store-link)
    (org-capture nil "i"))

  (defun org-capture-mail ()
    (interactive)
    (call-interactively 'org-store-link)
    (org-capture nil "@"))

  ;; Use full window for org-capture
  (add-hook 'org-capture-mode-hook 'delete-other-windows))

  (define-key global-map (kbd "C-c a") 'org-agenda)
  (define-key global-map (kbd "C-c c") 'org-capture)
  (define-key global-map (kbd "C-c i") 'org-capture-inbox)

(setq org-tags-column 50)
(setq org-auto-align-tags t)


  (setq org-agenda-hide-tags-regexp ".")
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo   . " ")
          (tags   . " %i %-12:c")
          (search . " %i %-12:c")))


;; email
(setq sendmail-program "/opt/homebrew/bin/msmtp"
      auth-sources (quote (:macos-keychain-internet :macos-keychain-generic))
      send-mail-function #'smtpmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function #'message-send-mail-with-sendmail)

(after! mu4e
  (define-key mu4e-headers-mode-map (kbd "C-c i") 'org-capture-mail)
  (define-key mu4e-view-mode-map    (kbd "C-c i") 'org-capture-mail)

  ;; (setq mu4e-context-policy 'ask-if-none
  (setq  mu4e-compose-context-policy 'always-ask)

  (set-email-account! "v vbdjames@gmail.com"
                      '((mu4e-sent-folder . "/vbdjames@gmail.com/sent")
                        (mu4e-drafts-folder . "/vbdjames@gmail.com/drafts")
                        (mu4e-trash-folder . "/vbdjames@gmail.com/trash")
                        (mu4e-refile-folder . "/vbdjames@gmail.com/archive")
                        (smtpmail-smtp-user . "vbdjames@gmail.com")
                        (user-mail-address . "vbdjames@gmail.com")
                        (mu4e-compose-signature . "---\nDoug James"))
                      t)
  (set-email-account! "c doug.james@customviewbook.com"
                      '((mu4e-sent-folder . "/doug.james@customviewbook.com/sent")
                        (mu4e-drafts-folder . "/doug.james@customviewbook.com/drafts")
                        (mu4e-trash-folder . "/doug.james@customviewbook.com/trash")
                        (mu4e-refile-folder . "/doug.james@customviewbook.com/archive")
                        (smtpmail-smtp-user . "doug.james@customviewbook.com")
                        (user-mail-address . "doug.james@customviewbook.com")
                        (mu4e-compose-signature . "---\nDoug James")))
  (set-email-account! "w doug.james@digitalwave.com"
                      '((mu4e-sent-folder . "/doug.james@digitalwave.com/sent")
                        (mu4e-drafts-folder . "/doug.james@digitalwave.com/drafts")
                        (mu4e-trash-folder . "/doug.james@digitalwave.com/trash")
                        (mu4e-refile-folder . "/doug.james@digitalwave.com/archive")
                        (smtpmail-smtp-user . "doug.james@digitalwave.com")
                        (user-mail-address . "doug.james@digitalwave.com")
                        (mu4e-compose-signature . "---\nDoug James")))
  (set-email-account! "d doug@dwjames.org"
                      '((mu4e-sent-folder . "/doug@dwjames.org/sent")
                        (mu4e-drafts-folder . "/doug@dwjames.org/drafts")
                        (mu4e-trash-folder . "/doug@dwjames.org/trash")
                        (mu4e-refile-folder . "/doug@dwjames.org/archive")
                        (smtpmail-smtp-user . "doug@dwjames.org")
                        (user-mail-address . "doug@dwjames.org")
                        (mu4e-compose-signature . "---\nDoug James")))
  (setq +mu4e-gmail-accounts '(("vbdjames@gmail.com" . "/vbdjames@gmail.com")
                               ("doug.james@customviewbook.com" . "/doug.james@customviewbook.com")
                               ("doug.james@digitalwave.com" . "/doug.james@digitalwave.com"))))

;;
(provide 'config)
;;; config.el ends here
