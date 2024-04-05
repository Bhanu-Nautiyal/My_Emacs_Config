* This is my Emacs Config File
** Adding the 'use-package'
#+begin_src emacs-lisp
(require 'package)

(setq package-enable-at-startup nil) ;;ye line mene "Uncle-Dave" ki video3 se teepi hai.


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;;ye initialize karta hai use-package ko on Non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
#+end_src
** Customizing up the Initial scratch buffer 
#+begin_src emacs-lisp
(setq inhibit-startup-message t)

(setq initial-scratch-message ";; चिन्तया जायते दुःखं नान्यथेहेति निश्चयी। तया हीनः सुखी शान्तः सर्वत्र गलितस्पृहः॥---
 ;; ==> चिंता से ही दुःख उत्पन्न होते हैं किसी अन्य कारण से नहीं, ऐसा निश्चित रूप से जानने वाला, चिंता से रहित होकर सुखी, शांत और सभी इच्छाओं से मुक्त हो जाता है ।")
#+end_src

+ NOTE: YE JO INITIAL-SCRATCH-MESSAGE HAI YE SCRATCH BUFFER ME AATA HAI. JAB EMACS LOAD HOTI HAI. MENE ISE YHA CONFIGURE KIA HAI.

** Setting up the user and the user-email-id
#+begin_src emacs-lisp

(setq user-full-name "USER_NAME"
      user-mail-address "USER_NAME@gmail.com")
#+end_src

** My Shortcut key to change the "inti.el" file when I want to.
Since i want to edit my "init.el" file whenever i wanna. So I created a shorcut that is enabled globally.
#+begin_src emacs-lisp
 (defun emacs-editing-init-file-shortcut ()
  (interactive)
  (find-file-read-only "~/.emacs.d/init.el")) ;;yha mene init.el file ko kholne ka shortcut bnaya hai by EMACS-LISP
;;[NOTE: "find-file" bss ye use karta me to file khulti magar write mode me only. Mene use kia "find-file-read-only" Ye buffers ko READ mode me kholti hai. Aur haa ""find-file--read-only" alag function hai use yha mt use karna . Mereko vaise smjh ni aaya ye hai kya.]
(global-set-key (kbd "C-c e") 'emacs-editing-init-file-shortcut) ;<== Yha mene uski binding set ki to OPEN .init.el file in READ-ONLY-MODE
#+end_src

Whenever I use the shorcut keystrokes it will open the "init.el" buffer in *"READ-MODE"* only.

** Enabling/Disabling Some Modes
#+begin_src emacs-lisp
(global-visual-line-mode 1);;ye code line change hone par arrow aati hai emacs me[word-wrap] use hatane ke liye hai 
;;---------------------------------------------------------------------------------------------------------------------------------------------
;(global-linum-mode t)
(global-display-line-numbers-mode 1)  ;;ye line global linum mode se better hai kyuki line numbers highlight hote h aur thodi padding aati hai.

(global-prettify-symbols-mode 1) ;;ye line globally kuch symbols ko prettify karta hai jaise lambda ko λ convert karta hai.

(global-hl-line-mode t) ;;yaha line highlight hoti hai jispe me currently kaam kar rha hu.

(global-highlight-parentheses-mode 1)

;;(recentf-mode 1) ;; ye mode on rkhne se emacs ko idea rehta h ki last time mene konsi file kholi thi. Ye milega "M-x recentf open files"

(save-place-mode 1) ;;ye mode emacs file jo save ho gyi usme mere cursor kaha tha yaad rkhega.

(global-auto-revert-mode 1)

(set-default-coding-systems 'utf-8) ;;mene yha default coding system set kia hai.

(setq global-auto-revert-non-file-buffers t)

(display-time-mode 1)

(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook
		neotree-mode-hook
		treemacs-mode-hook
		vterm-mode-hook
		eww-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode -1))))
;;NOTE==> YAHA MENE SEEDHA EK VARIABLE "mode" LIYA AUR USME MAJOR MODES AS A LIST BANAKE DAAL DI. AUR EK SAATH add-hook KIA KI JAB-JAB YE MODES CHALE TO UNME LINUM MODE NAA CHALE BSS.


(add-hook 'doc-view-mode-hook          ;;NOTE=> YAHA MENE LINUM MODE KO DISABLE KIA HAI IN DOC-VIEW MODE ME TAAAKI PDFs KHULNE ME HANG NAA HO
	  (lambda () (display-line-numbers-mode -1)))        ;;EMACS ME. EMACS ME AGAR KOI MODE OFF KARNA HO TO US 'MAJOR-MODE' KA HOOK KO -1 SET KAR DO ESE
;;EXAMPLE: doc-view-mode ke sath mene yaha -1 set kia hai taaki linum mode naa ON ho jab ye mode khule.
;;NOTE=>> ABHI BHI EMACS MAIN BADI PDFS NI KHULTI. HANG HO JATA HAI YE USME.
;;---------------------------------------------------------------------------------------------------------------------------------------------
(add-hook 'after-init-hook 'global-company-mode) ;;yaha mene COMPANY-MODE har jagah par on kar dia hai
(setq company-idle-delay 0) ;;yha mene 'company-mode' ka delay 0 secs set kia h
(setq company-minimum-prefix-length 3) ;;yha mene ye likha ki jb 3 words type ho tbhi company completions dikhaye

(scroll-bar-mode -1) ;;yaha se scroll bar ko manually off karte hai
(tool-bar-mode -1)   ;;yaha se tool bar ko manually off karte hai
(tooltip-mode -1)    ;;yaha mene tool tips ko off kara hai
(display-battery-mode 1) ;;yaha Emacs ki DOOM MODE LINE me BATTERY show karane ke liye
(set-fringe-mode 10)  
(menu-bar-mode -1)   ;;yaha mene menubar hata diya 

#+end_src

** Setting Fonts
Before using my fonts please download the following fonts:
+ Fanstasque Sans Mono
+ D2Coding
+ Source Code Pro
#+begin_src emacs-lisp

(set-face-attribute 'default nil
		    :font "Fantasque Sans Mono"  ;;=> yaha agar mene font "Comic Sans MS" use kara to height 110 rkhna
		    :height 165
		    :weight 'medium)             ;;=> aur font "Fira Code Retina" use kara to height 110 rkhna

(set-face-attribute 'variable-pitch nil
  :font "D2Coding"
  :height 165
  :weight 'medium)

(set-face-attribute 'fixed-pitch nil
  :font "Source Code Pro"
  :height 165
  :weight 'medium)


#+end_src

** Themes
#+begin_src emacs-lisp
 ;;yaha mene default theme set kari hai
 (setq custom-safe-themes t);;YE KAAFI IMPORTANT COMMAND HAI. ISSE ME DOOM-THEMES PACKAGE SE DIRECT THEME DAAL RHA HU TO EMACS BAAR BAAR POOCHTA HAI KI KYA LISP CODE THEME KA RUN KARU?? TO IS COMMAND SE VO NI POOCHTA BAAR BAAR KI THEME RUN KARU KI NI
 ;;(load-theme 'doom-dracula) ;;<= Mene yaha par "t" ni lgaya tha doom themes ke liye magar sahi chal rhi thi theme.
 (load-theme 'doom-one) ;;theme load karne ke liye vo system me honi chahiye aur ese mat likhna ise "(load-theme "wombat")"
 ;;theme ka naam single quote se likhna naa ki double quotes me

 ;;----------->>[Doom Themes ko mene uncomment kia hai yaha]-------------------------------------
 (use-package doom-themes
   :ensure t
   :defer t
   :config  (load-theme 'doom-one t))

 ;;theme change karne ke liye M-x counsel load theme par jaao. Vaha pe theme check karlo and jo pasand aaye uska naam dekh lo.
 ;;TO CHANGE THEME DONO JAGAH 1.)(load-theme 'name-of-theme)
 ;;                           2.)(doom-theme) DONO JAGAH THEME KA NAAM BADLO

 ;;---------------------------------------------------------------------------------------------

 ;;--------------------------------[Spacemacs-Theme]---------------------------------------------
 ;In 3 lines ko bass uncomment kar dena agar spacemacs theme ko use karna ho
 ;; (use-package spacemacs-theme
 ;;   :defer t
 ;;   :init (load-theme 'spacemacs-dark t))

 ;;NOTE: Ye chal ni rha thi pehle jab mene install ki thi .
 ; Mene ye likha tha (use-package spacemacs-theme
			;:config (load-theme 'spacemacs-dark t))
 ;Magar error de thi ye theme  ==> Cannot load spacemacs-theme by use-package.
 ;;TO mene ise theek karne ke liye pehle defer karwaya aur init karwaya isme.
 ;;Mene ye solution net se teepa hai::
   ; :defer t will prevent requiring spacemacs-theme, which doesn't exist, :config ... will run some code after spacemacs-theme (a non-existent feature) is required. And since use-package doesn't look very meaningful here
 ;;----------------------------------[Dracula-Theme]--------------------------------------------

 ;; (use-package dracula-theme
 ;;   :defer t)

 ;;-----------------------------------[ATOM-ONE-DARK-THEME]-------------------------------------

 ;; (use-package atom-one-dark-theme
 ;;   :defer t)

 ;;-----------------------------------[VSCODE-THEMES]-------------------------------------------
 ;; (use-package vscode-dark-plus-theme
 ;;   :defer t)

 ;;-----------------------------------[CHERRY-BLOSSOM-THEME]------------------------------------

 ;; (use-package cherry-blossom-theme
 ;;   :ensure t)

 ;;-----------------------------------[CYANOMETRIC-THEME]-------------------------------------

 ;; (use-package cyanometric-theme
 ;;   :ensure t)

 ;;-------------------------------[ANCIENT-ONE-DARK-THEME]-------------------------------------
 ;; (use-package ancient-one-dark-theme
 ;;   :ensure t)

 ;;-------------------------------[EXOTICA-THEME]-----------------------------
 ;; (use-package exotica-theme
 ;;   :ensure t)

#+end_src

** Setting up the comments bold and keywords bold+italics
#+begin_src emacs-lisp
;;NOTE: In dono lines ko theme ke baad daalo kyuki ye agat theme se pehle likh du me to ye overwrite ho jate hai agar baad me theme load hui to.
;;ye mene keywords ko thoda slant kara hai
(set-face-attribute 'font-lock-comment-face nil
  :weight 'bold) ;;ye comments ko bold karne ke liye hai 
(set-face-attribute 'font-lock-keyword-face nil
  :weight 'bold
  :slant 'italic) ;;ye keywords ko bold karne ke liye hai.

#+end_src
*** Hooks Make Text editing more productive
#+begin_src emacs-lisp

(add-hook 'text-mode-hook 'flyspell-mode) ;; {Text-file (.txt) files me spelling check karne ke liye hai ye}

#+end_src

** All the Icons Package for beautiful icons
#+begin_src emacs-lisp
(use-package all-the-icons) ;;ise daal diya hai mene magar use karna ni aarha
;;yaha mene ivy me icons daale hai
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1)) 

#+end_src

** IVY Package with 'Fuz'
#+begin_src emacs-lisp
(use-package ivy
  :config
  (ivy-mode t))


(use-package ivy-rich ;;yaha mene ivy-rich package daala. Ye package "COUNSEL M-x" commands ki description deta hai..Ki kaunsi command kya karti hai
  :init
  (ivy-rich-mode 1))

(setq ivy-initial-inputs-alist nil) ;; ye line "M-x" me "^" symbol aata h jb me "counsel M-x" mene bind kr dia h ivy ke saath.

;;---------------------[IVY AUR FUZZY SEARCH EK SAATH]-----------------------

(use-package fuz ;;YE PACKAGAE FUZZY SEARCH KRTA HAI
  :ensure t
  :defer t)

;;YE PACKAGE MENE INSTALL NI KIA HUA KYUKI YE "M-x" KE SAATH THEEK NI CHAL RHA

;; (use-package ivy-fuz ;;YE "fuz" PACKAGE KE SAATH 'IVY-FUZ' INTERGRATION DETA HAI 
;;   :ensure t
;;   :defer t
;;   :demand t ;; iske baare me 'use-package' pe jaake pdhna github pe.
;;   :after ivy
;;   :custom
;;   (ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
;;   (ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy))))

#+end_src

** Counsel
#+begin_src emacs-lisp
(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode t))

 ;;ye package ivy-mode ke saath use hota hai ..iske baare me jaana ho to run karo=> M-x describe-package...aur counsel likh do aur uske baare mepadh lo

;;NOTE==> (use-package counsel ;;ISE ESE CONFIG MAT KRDENA BSS 'C-h b' COMMAND THEEK SE NI CHAL RHI THI.
;;               :after ivy
;;               :config (counsel-mode))

#+end_src

** Doom Modeline
#+begin_src emacs-lisp
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1) ;;pehle ye variable 1 tha 
  :config
  (setq doom-modeline-height 20) ;;pehle ye variable 10 tha. Font ke hisaab se ye change krta hai.
  (set-face-attribute 'mode-line nil
		      :font "Khmer OS"
		      :height 150)

  (set-face-attribute 'mode-line-inactive nil
		      :family "Khmer OS"
		      :height 150))

#+end_src

+ *NOTE* : Since Im using different font for the modeline as well so download "Khamer OS" so that doom-modeline can use it. Otherwise it will not work.
+ Also you can use the different font for the doom-modeline just replace "Khamer OS" with any font you like ;-). But there is issue with the ":height" keyword relatedt to the adjustment of the font with modeline width so you can change accordingly to your liking.

** Battery Notifier
#+begin_src emacs-lisp
(use-package battery-notifier
  :ensure t
  :init
  (battery-notifier-mode 1))

#+end_src

** PROGRAMMING
*** Quickrun
This is damm Awesome package for the programming languages like C++ etc that give me code running on the fly just like VSCode coderunner.
#+begin_src emacs-lisp
(use-package quickrun
  :ensure t
  :defer t)

#+end_src
*** Racket and Rust Programming
#+begin_src emacs-lisp
(use-package racket-mode) ;;yaha mene racket mode daala hai

(use-package rainbow-delimiters ;;<==isse bass coloured brackets dikhte hai, brackets auto completions ni deta
  :ensure t
  :defer t)
(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)

(add-hook 'racket-repl-mode-hook 'rainbow-delimiters-mode) ;;<==ye racket repl mode me colored brackets daalne ke liye hai

(use-package smartparens   ;;<== isse bass brackets ka auto completions hota hai bss na ki colored brackets aate hai
  :ensure t
  :defer t)

(add-hook 'racket-mode-hook #'smartparens-mode)

;---[yaha mene elisp ke liye rainbow brackets daale hai]------
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
;--------------------------------------------------------------
(use-package flymake-racket
  :defer t
  :ensure t
  :commands (flymake-racket-add-hook)
  :init
  (add-hook 'scheme-mode-hook #'flymake-racket-add-hook)
  (add-hook 'racket-mode-hook #'flymake-racket-add-hook))

;;-----------------------------------------------------[RUST PROGRAMMING]------------------------
;;YAHA MENE TOML PACKAGE DAALA HAI [FOR RUST PROGRAMMING LANGUAGE]
(use-package toml-mode) ;;YE VAISE 'CARGO -> RUST PACKAGE MANAGER' KE LIYE DAALA HAI 
 
;yaha mene RUST PROGRAMMING LANGUAGE KE LIYE ASLI PACKAGE DAALA HAI
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . prettify-symbols-mode))

(add-hook 'rust-mode-hook (lambda () (local-set-key (kbd "<f6>") #'quickrun-shell)))

#+end_src

