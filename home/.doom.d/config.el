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

(setq fancy-splash-image "~/.doom.d/themes/marisa.png")
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

;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)

;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

;; Org-Roam
(setq org-roam-directory (file-truename "~/Notes/wiki"))

;; Org priorities
(setq org-highest-priority ?A
      org-default-priority ?E
      org-lowest-priority ?E)
(setq org-priority-faces '((?A . (:foreground "#b4637a"))
                           (?B . (:foreground "#d7827e"))
                           (?C . (:foreground "#ea9d34"))
                           (?D . (:foreground "#907aa9"))
                           (?E . (:foreground "#56949f"))))

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
;; Nakakatawa ka naman
(after! org-capture
  (add-to-list 'org-capture-templates
               '("r" "Refile" entry (file+headline org-default-notes-file "Refile") "* %?\n%U\n%i")))

(after! org-fancy-priorities
  (setq org-fancy-priorities-list '((?A . "⚑")
                                    (?B . "⬆")
                                    (?C . "■")
                                    (?D . "⬇")
                                    (?E . "❄"))))

(after! ispell
  (setq ispell-dictionary "en_US,tl")
  (ispell-hunspell-add-multi-dic "en_US,tl"))

(after! lsp-ltex
  (setq lsp-ltex-version "16.0.0")
  (setq lsp-ltex-additional-rules-enable-picky-rules "true")
  (setq lsp-ltex-language "en")
  (setq lsp-ltex-mother-tongue "tl-PH" ))
(add-hook 'org-mode-local-vars-hook (lambda ()
                                      (require 'lsp-ltex)
                                      (lsp-deferred)))
(add-hook 'markdown-mode-local-vars-hook (lambda ()
                                           (require 'lsp-ltex)
                                           (lsp-deferred)))

(add-hook 'spell-fu-mode-hook
          (lambda ()
            (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "en_US"))
            (spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "tl"))))

(after! which-key
  (setq which-key-idle-delay 0.1))

;; Key maps
;; open treemacs with >
(define-key doom-leader-map (kbd ">") 'treemacs)

;; onlyrmove through visual lines
(map! :after evil
      :map evil-motion-state-map
      [remap evil-next-line] #'evil-next-visual-line
      [remap evil-previous-line] #'evil-previous-visual-line)

;; Allow for C-y to accept company selection
(map! :after company
      :map company-active-map
      "RET" #'newline
      "C-y" #'company-complete-selection
      "C-e" #'company-abort)

(map! :leader
      :desc "Open plan/schedule"
      "n p" #'(lambda () (interactive) (find-file "~/Notes/assets/NewSchedule.jpg")))
