;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Scroll margins
(setq scroll-margin 8)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Gravity"
      user-mail-address "alternativegravitational@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
                                        ;a;

(setq doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu Sans Nerd Font" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-rose-pine-dawn)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-current-absolute t)
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Notes/")
;; Default
(setq org-archive-location (concat org-directory "/.archive/%s_archive::"))

;; Captures
(setq org-default-notes-file (concat org-directory "/refile.org"))
(setq org-capture-templates
      (append org-capture-templates
              '("r" "Refile" entry (file+headline org-default-notes-file "Refile") "* %?\n%U\n%i")))

;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)

;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

;; ltex lsp for org mode
(add-hook 'org-mode-local-vars-hook (lambda ()
                                      (require 'lsp-ltex)
                                      (lsp)))
;; ltex lsp for markdown
(add-hook 'markdown-mode-local-vars-hook (lambda ()
                                           (require 'lsp-ltex)
                                           (lsp)))


;; Org-Roam
(setq org-roam-directory (file-truename "~/Notes/wiki"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set the time delay (in seconds) for the which-key popup to appear. A value of
;; zero might cause issues so a non-zero value is recommended.
;;
;; Allow for movement in softwrapped text
(after! evil
  (define-key evil-motion-state-map [remap evil-next-line] #'evil-next-visual-line)
  (define-key evil-motion-state-map [remap evil-previous-line] #'evil-previous-visual-line))


(after! which-key
  (setq which-key-idle-delay 0.1))

;; Allow for C-y to accept company selection
(after! company
  (define-key company-active-map (kbd "RET") 'newline)
  (define-key company-active-map (kbd "C-y") 'company-complete-selection))

;; Key maps
(define-key doom-leader-map (kbd ">") 'treemacs)
