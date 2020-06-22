;; the package manager
(require 'package)
(setq
 use-package-always-ensure t
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'ox-latex)
(setq org-latex-listings t)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))

;; PDF Openner
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))

;; Add languages
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "plantuml")))  ; don't ask for plantuml
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

(add-to-list
  'org-src-lang-modes '("plantuml" . plantuml))

;; Add all org-files in ./Dropbox/org

 '(org-agenda-files
   (quote
    ("~/Dropbox/org/refile.org" "~/Dropbox/org/profdev.org" "~/Dropbox/org/gsd.org" "~/Dropbox/org/asystima.org" "~/Dropbox/org/Abigail.org" "~/Dropbox/org/Noah.org" "~/Dropbox/org/Luke.org" "~/Dropbox/org/Tram.org" "~/Dropbox/org/fit.org" "~/Dropbox/org/Abigail.org" "~/Dropbox/org/sys-etivs.org" "~/Dropbox/org/sys-bob.org" "~/Dropbox/org/sys-esadwg.org" "~/Dropbox/org/win.org")))
 '(org-directory "~/Dropbox/org")

;; For El Captian for find the TeX distribution
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
(setq exec-path (append exec-path '("/Library/TeX/texbin")))

;; The following lines are always needed. From org-mode manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
  '("myieee"
  "\\documentclass[twocolumn]{IEEEtran}
	\\usepackage{amsfonts, amssymb, amsmath}
	\\usepackage{calc}
	\\usepackage{graphicx}
	\\usepackage{mathptmx}
	\\usepackage[T1]{fontenc}
	\\usepackage{blindtext}
	\\usepackage{enumitem}
	\\usepackage{hyperref}
	\\newcommand\\foo{bar}
		[NO-DEFAULT-PACKAGES]
		[NO-PACKAGES]
		[EXTRA]"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 )

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
  '("myacm"
  "\\documentclass[acmlarge, screen, review, nonacm, timestamp]{acmart}
	\\newcommand\\foo{bar}
		[NO-DEFAULT-PACKAGES]
		[NO-PACKAGES]
		[EXTRA]"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 )

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
  '("myarticle"
  "\\documentclass[article, openany, letterpaper, twoside]{memoir}
	\\usepackage{amsfonts, amssymb}
	\\usepackage{calc}
	\\usepackage{fullpage}
	\\usepackage{graphicx}
	\\usepackage{blindtext}
	\\usepackage{enumitem}
	\\usepackage{hyperref}
	\\usepackage{lmodern}
	\\usepackage[T1]{fontenc}
	\\usepackage{comment}

	\\newcommand\\foo{bar}
	[NO-DEFAULT-PACKAGES]
	[NO-PACKAGES]
	[EXTRA]"
	("\\chapter{%s}" . "\\chapter*{%s}")
	("\\section{%s}" . "\\section*{%s}")
	("\\subsection{%s}" . "\\subsection*{%s}")
	("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	("\\paragraph{%s}" . "\\paragraph*{%s}")
	("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
)

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
  '("mybook"
  "\\documentclass[9pt, onecolumn, openany, letterpaper, twoside]{memoir}
        \\usepackage{fullpage}
	\\usepackage{amsfonts, amssymb}
	\\usepackage{calc}
	\\usepackage{graphicx}
	\\usepackage{blindtext}
	\\usepackage{enumitem}
	\\usepackage{hyperref}
	\\usepackage{lmodern}
	\\usepackage[T1]{fontenc}
	\\usepackage{comment}

	\\newcommand\\foo{bar}
	[NO-DEFAULT-PACKAGES]
	[NO-PACKAGES]
	[EXTRA]"
	;;("\\part{%s}" . "\\part*{%s}")
	("\\chapter{%s}" . "\\chapter*{%s}")
	("\\section{%s}" . "\\section*{%s}")
	("\\subsection{%s}" . "\\subsection*{%s}")
	("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	("\\paragraph{%s}" . "\\paragraph*{%s}")
	("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
)


;; MSFT TEMPLATE
;; My custom LaTeX class for Org-mode export. require is needed for it to work.
(add-to-list 'org-latex-classes
  '("msftarticle"
  "\\documentclass[letterpaper]{article}

	\\usepackage{amsfonts}
	\\usepackage{calc}
	\\usepackage{enumitem}
	\\usepackage{hyperref}
	\\usepackage{comment}
	\\usepackage[T1]{fontenc}

	\\usepackage[utf8]{inputenc}
	\\usepackage{hyperref}
	\\usepackage{array}
	\\usepackage{lastpage}
	\\usepackage{lipsum}
	\\usepackage{fancyhdr, multicol}
	\\usepackage[hmargin=0.50in,top=1.5in,headheight=65pt,footskip=55pt]{geometry}
	\\usepackage{amsmath,amsthm,amsfonts,amssymb, steinmetz}
	\\usepackage{framed,verbatim,listings,dirtree}
	\\usepackage[scaled]{helvet}
	\\renewcommand\\familydefault{\\sfdefault}
		\\usepackage{newtxsf}
	\\usepackage[T1]{fontenc}

	\\usepackage{graphicx}
	\\usepackage[english]{babel}


	\\setlength{\\parindent}{0.95cm}
		\\pagestyle{fancy}
		\\renewcommand{\\headrulewidth}{0pt}
		\\fancyhead[CO,LO,RO]{} %% clear out all headers
%		\\fancyhead[CE,CO,LE,LO,RE,RO]{} %% clear out all headers
		\\fancyhead[C]{%
			\\begin{tabular}{|m{1.50in}|m{3.25in}|m{1.5in}|}
				\\hline
				\\smallskip
				\\centering
				\\includegraphics[scale=0.390]{logo.png} &
				\\centering
				\\Large{\\realtitle} &
				\\centering
				\\footnotesize{Page. \\thepage\\ of \\pageref{LastPage}\\\\
				Date: \\today \\\\
				Rev. A}\\tabularnewline
				\\hline
			\\end{tabular}%
	}
	\\fancyfoot[C]{%
		\\begin{tabular}{|m{1.5in}|m{4.5in}|}
			\\hline
			\\centering
			\\small{Microsoft Proprietary} &
			\\scriptsize{\\textbf{PROPRIETARY INFORMATION:}
			THIS DOCUMENT IS INTERNAL TO MICROSOFT AND MAY CONTAIN CONFIDENTIAL
			AND PROPRIETARY INFORMATION.  ANY UNAUTHORIZED USE IS PROHIBITED. 
			} 
			\\tabularnewline
			\\hline
		\\end{tabular}%
		}

	\\newcommand\\foo{bar}
		[NO-DEFAULT-PACKAGES]
		[NO-PACKAGES]
		[EXTRA]"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
 )
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (darcula)))
 '(custom-safe-themes
   (quote
    ("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (quote
    ("#eef6d970af00" "#cef5e0cccfbb" "#fd55c91cb29c" "#dadbd2efdc17" "#e0a3de02afa1" "#f84bcba1ad99" "#d28bd9ebdf8a")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#b3c34d" . 20)
     ("#6ccec0" . 30)
     ("#74adf5" . 50)
     ("#e1af4b" . 60)
     ("#fb7640" . 70)
     ("#ff699e" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#e1af4b" "#fb7640" "#ff6849" "#ff699e" "#8d85e7" "#74adf5" "#6ccec0" "#b3c34d")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(lsp-ui-doc-border "#586e75")
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (solarized-theme markdown-mode darcula-theme scala-mode use-package openwith)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ca7966832090")
     (60 . "#c05578c91534")
     (80 . "#b58900")
     (100 . "#a6088eed0000")
     (120 . "#9e3a91a60000")
     (140 . "#9628943b0000")
     (160 . "#8dc596ad0000")
     (180 . "#859900")
     (200 . "#76ef9b6045e8")
     (220 . "#6cd69ca95b9d")
     (240 . "#5f5f9e06701f")
     (260 . "#4c1a9f778424")
     (280 . "#2aa198")
     (300 . "#3002984eaf4d")
     (320 . "#2f6f93e8bae0")
     (340 . "#2c598f79c66f")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 141 :width normal)))))
