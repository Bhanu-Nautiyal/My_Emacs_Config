;;;MENE YE INIT FILE BANAI HAI 

(setq inhibit-startup-message t)

(setq initial-scratch-message ";; चिन्तया जायते दुःखं नान्यथेहेति निश्चयी। तया हीनः सुखी शान्तः सर्वत्र गलितस्पृहः॥---
 ;; ==> चिंता से ही दुःख उत्पन्न होते हैं किसी अन्य कारण से नहीं, ऐसा निश्चित रूप से जानने वाला, चिंता से रहित होकर सुखी, शांत और सभी इच्छाओं से मुक्त हो जाता है ।")

;;NOTE: YE JO INITIAL-SCRATCH-MESSAGE HAI YE SCRATCH BUFFER ME AATA HAI. JAB EMACS LOAD HOTI HAI. MENE ISE YHA CONFIGURE KIA HAI
;;==========================================================================================================
;;------------------------------------------------[MY-USER-DEFINED-FUNCTIONS]-------------------------------

(setq user-full-name "Lord Of The Seven Seas"
      user-mail-address "shvetketu@disroot.org")


(defun emacs-editing-init-file-shortcut ()
  (interactive)
  (find-file-read-only "~/.emacs.d/init.el")) ;;yha mene init.el file ko kholne ka shortcut bnaya hai by EMACS-LISP
;;[NOTE: "find-file" bss ye use karta me to file khulti magar write mode me only. Mene use kia "find-file-read-only" Ye buffers ko READ mode me kholti hai. Aur haa ""find-file--read-only" alag function hai use yha mt use karna . Mereko vaise smjh ni aaya ye hai kya.]
(global-set-key (kbd "C-c e") 'emacs-editing-init-file-shortcut) ;<== Yha mene uski binding set ki to OPEN .init.el file in READ-ONLY-MODE
;;----------------------------------------------------------------------------------------------------------



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Note: Agar mujhe "MAJOR BUFFER" ke hisaab se keybindings set krni hai to "define-key" ka use krna. Magar isme ek dikkat ye hai ki iski mujhe buffer ka naam dega pdega. Me scratch buffer me in commands ko run ni kr paunga isiliye mujhe buffers ka naam dena pdega aur file save krni pdegi. Agar mujhe Scratch Buffer me command run krni hai to mereko "global-set-key" ka use krna pdega hi pdega . Tbhi "SLY" ko mene "global-set-key" se set kia tha ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;==========================================================================================================
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


;;;===============================[YAHA MENE FONT STYLE CHANGE KIA HAI]============================ 

;;---------------------------------[SETTING-FONTS]--------------------------------------------------

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


;;=================================================================================================
;;--------------------------------------------[THEMES]---------------------------------------------
;;yaha mene default theme set kari hai
(setq custom-safe-themes t);;YE KAAFI IMPORTANT COMMAND HAI. ISSE ME DOOM-THEMES PACKAGE SE DIRECT THEME DAAL RHA HU TO EMACS BAAR BAAR POOCHTA HAI KI KYA LISP CODE THEME KA RUN KARU?? TO IS COMMAND SE VO NI POOCHTA BAAR BAAR KI THEME RUN KARU KI NI
;;(load-theme 'doom-dracula) ;;<= Mene yaha par "t" ni lgaya tha doom themes ke liye magar sahi chal rhi thi theme.
(load-theme 'doom-one) ;;theme load karne ke liye vo system me honi chahiye aur ese mat likhna ise "(load-theme "wombat")"
;;theme ka naam single quote se likhna naa ki double quotes me

;;----------->>[Doom Themes ko mene uncomment kia hai yaha]-------------------------------------
;; (use-package doom-themes
;;   :ensure t
;;   :defer t
;;   :config  (load-theme 'doom-one t))

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

;;-------------------------------[]--------------------------------

;;----------------------------------------------------------------------------------------------
;;---------------[SETTING UP THE COMMENTS BOLD AND KEYWORDS BOLD & ITALICS]---------------------

;;NOTE: In dono lines ko theme ke baad daalo kyuki ye agat theme se pehle likh du me to ye overwrite ho jate hai agar baad me theme load hui to.
;;ye mene keywords ko thoda slant kara hai
(set-face-attribute 'font-lock-comment-face nil
  :weight 'bold) ;;ye comments ko bold karne ke liye hai 
(set-face-attribute 'font-lock-keyword-face nil
  :weight 'bold
  :slant 'italic) ;;ye keywords ko bold karne ke liye hai.

;;----------------------------------------------------------------------------------------------


;;(use-package PACKAGE-NAME) ye command run karne se Emacs package install kar leta hai MAGAR BY DEFAULT LOAD NI KARTA PACKAGE KO....


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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(custom-safe-themes
   '("e80b1078c4ce2225f6f8d7621a55d3b675c86cad505b22b20243d4d075f491f5" "3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "3ea75460d74cd219f1bfef60ed2f9401c415b950475bdcae600a979648f3ca3d" "fe36e4da2ca97d9d706e569024caa996f8368044a8253dc645782e01cd68d884" "265f68939a70832a73137ef621b14882f83643882b1f0dfa2cd35b91b95afbcc" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "bfac9f5b962572739db905a07a2d8d32b25258cd67826727d354013b63d8529e" "9eecd688ffd00df3a218a323ceedf3f0f2950dd2347c9b708929a347bf46d2d4" "f426a5e99450eaa66915fc3b913ed3a93d15031a4fc082558f315e2fe149779d" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "d916b686ba9f23a46ee9620c967f6039ca4ea0e682c1b9219450acee80e10e40" "dc2cdca2f32386a308057cac6abde24c07b470cf17847c784c79ecd3a23ee09a" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "1d89fcf0105dd8778e007239c481643cc5a695f2a029c9f30bd62c9d5df6418d" "f99318b4b4d8267a3ee447539ba18380ad788c22d0173fc0986a9b71fd866100" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "d2e0c53dbc47b35815315fae5f352afd2c56fa8e69752090990563200daae434" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "7b1ea77093c438aa5887b2649ca079c896cc8780afef946d3b6c53931081a726" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "c7000071e9302bee62fbe0072d53063da398887115ac27470d664f9859cdd41d" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "b7e460a67bcb6cac0a6aadfdc99bdf8bbfca1393da535d4e8945df0648fa95fb" default))
 '(elfeed-feeds
   '("https://news.ycombinator.com/newest" "https://planet.emacslife.com/atom.xml" "https://feeds.feedburner.com/TheHackersNews"))
 '(exwm-floating-border-color "#242530")
 '(fci-rule-color "#6272a4")
 '(highlight-tail-colors
   ((("#2c3e3c" "#2a3b2e" "green")
     . 0)
    (("#313d49" "#2f3a3b" "brightcyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(package-selected-packages
   '(ag quickrun fancy-battery spaceline-all-the-icons spaceline tron-legacy-theme melancholy-theme exotica-theme spice-mode ancient-one-dark-theme carbon-now-sh cyanometric-theme live-py-mode realgud typit disaster multiple-cursors visual-fill-mode plantuml-mode org-modern org-compile fuz sxiv nnhackernews haskell-mode elfeed-goodies elfeed cherry-blossom-theme dired-open tldr discover-my-major iedit org-roam battery-notifier gnu-elpa-keyring-update vundo ivy-emms bongo letterbox lettetbox-mode manage-minor-mode-table manage-minor-mode rainbow-mode mark-multiple malinka rjsx-mode treemacs-all-the-icons dashboard treemacs-icons-dired treemacs shell-pop flycheck-irony flychek-irony flycheck highlight-indent-guides yasnippet-snippets company-irony auctex 0blayout minimap sudo-edit webpaste emms-mode-line-cycle emms-mode-line-icon emms anaconda-mode beacon popup-kill-ring vscode-dark-plus-theme atom-one-dark-theme atom-onde-dark-theme pacmacs dracula-theme spacemacs-theme highlight-parentheses org-superstar projectile vterm symon writeroom-mode sly which-key gcmh rainbow-delimiters smartparens smex emojify magit org-bullets elpy pdf-tools neotree neo-tree rust-mode flymake-racket toml-mode all-the-icons-dired all-the-icons-ivy-rich all-the-icons-ivy racket-mode geiser-mit ivy-rich doom-themes doom-modeline counsel ivy use-package))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(pdf-view-use-unicode-ligther nil)
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(spaceline-all-the-icons-separator-type 'arrow)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-log-types '((use-package)))
 '(warning-suppress-types '(((tar link)) ((tar link)) ((tar link)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------[SOME HOOKS TO MAKE TEXT EDITING MORE PRODUCTIVE]---------------------

(add-hook 'text-mode-hook 'flyspell-mode) ;; {Text-file (.txt) files me spelling check karne ke liye hai ye}

;;-----------------------------------------------------------------------------------------------
;;YAHA MENE ALL THE ICONS PEHLE DAAL DIA HAI IVY MODE SE [YE MENE GITHUB SE PDHA HAI ALL THE ICONS IVY MODE PACKAGE KI DESCRIPTION SE]
(use-package all-the-icons) ;;ise daal diya hai mene magar use karna ni aarha
;;yaha mene ivy me icons daale hai
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1)) 

;;yaha mene DIRED MODE KE LIYE ICONS LGAYE HAI

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

;;;NOTE: AGAR MUJHE HOOKS LGANE HAI KISI PACKAGE KE KISI MAJOR MODE PE VO BHI "use-package" ke andar to us case me ese likhna hota h.
   ;(use-package package-name
   ;   :hook (package-name . vo-mode-jisme-hook-lagana-hai))
; isse me (add-hook 'name-hook 'function) bahar lgane se bach jaunga.

;;--------------------------------[IVY]--------------------------------------
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

;;-------------------------------[COUNSEL]------------------------------------
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

;;-------------------------------------[DOOM-MODELINE]--------------------------------------------------------

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


;;NOTE: Me pehle vairable ese config krta tha modeline ki height. Jaise mene neeche kia hai using :config
;; (use-package doom-modeline
;;   :ensure t
;;   :init
;;   (doom-modeline-mode 1)
;;   :custom  ;;yaha bhool kar bhi :config use mat karna ;;":custom" se ese me variables set kr skta hu bina ":config" use kiye.
;;   ((doom-modeline-height 10)))


;;----------------------------------[LOW-BATTERY-NOTIFIER]----------------------------------------------------

(use-package battery-notifier
  :ensure t
  :init
  (battery-notifier-mode 1))

;;------------------------------------------------------------------------------
;;(use-package geiser-racket) yaha mene geiser se racket daalne ka jugaad kia tha magar error aayi
;;-----------------------------------------------[RACKET LANGUAGE]--------------------------------------------
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

;------------------------------------------------------[NEOTREE]-------------------------------
;;YAHA MENE TREEMACS DAALI HAI
;(use-package neotree)
;(global-set-key [f8] 'neotree-toggle) ;;YAHA MENE SET KI HAI F8 KEY DABANE SE NEOTREE AAYEGA AUR JAYEGA
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;YE KUCH COMMANDS HAI JO BSS NEOTREE MAIN CHALENGI 

;Only in Neotree Buffer:

;1. n next line, p previous line。
;2. SPC or RET or TAB Open current item if it is a file. Fold/Unfold current item if it is a directory.
;3. U Go up a directory
;4. g Refresh
;5.  A Maximize/Minimize the NeoTree Window
;6.  H Toggle display hidden files
;7.  O Recursively open a directory
;8.  C-c C-n Create a file or create a directory if filename ends with a ‘/’
;9.  C-c C-d Delete a file or a directory.
;10. C-c C-r Rename a file or a directory.
;11. C-c C-c Change the root directory.
;12. C-c C-p Copy a file or a directory.
;;--------------------------------------------------[Pdf-Tools-package]----------------------------------------------------------
;; yaha mene pdf tools daala hai
(use-package pdf-tools
  :defer t)

(add-hook 'pdf-view-mode-hook
	  (lambda () (display-line-numbers-mode -1)))   ;;yaha mene hook lgaya hai. Ki jaise hi mera pdf-view-mode chale to display linum mode disable ho jaye.

(add-hook 'doc-view-mode-hook 'pdf-tools-install)

;;NOTE==> Yaha mene hook lgaya hai ki jab bhi pdf kholu to pdf emacs me by default doc-view-mode me khulti hai. To mene pdf tools download kiye. Is hook se jab bhi pdf khulegi vo pdf-view-mode me khulegi.[VVIMP].

;;----------------------------------[HIGHLIGHT-INDENT-GUIDES]----------------------------------------------------
(use-package highlight-indent-guides
  :ensure t
  :hook
  (prog-mode . highlight-indent-guides-mode))

(setq highlight-indent-guides-method 'character)
;; YAHA " 'character " ke alava " 'bitmap " aur  " 'column " bhi hai.

;;-----------------------[FLYCHECK-MODE (PROGRAMMING LANGUAGES KE SYNTAX CORRECTION KE LIYE)]---------------------

(use-package flycheck 
  :ensure t)

(add-hook 'prog-mode-hook 'flycheck-mode) ;;sbhi programming modes ke liye mene ise enable kia hai.

(use-package flycheck-irony
  :ensure t)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)) ;;ye mene net se teepa hai.

;;---------------------------------[SHELL-POP {EK ESA SHELL KO BASS POP KRANE KE LIYE HAI}]----------------------

(use-package shell-pop
  :ensure t
  :defer t
  :bind
  (("C-c s" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/usr/bin/zsh")
  (setq shell-pop-cleanup-buffer-at-process-exit t) ;;ye by default shell ko kill kar dega jb me exit krunga.
  (setq shell-pop-window-position "bottom")) ;;ye change kia jaa skta hai "right","left","top", "bottom" aur "full".

 ;(setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell))))) ;<== PEHLE MENE YE KIA THA CONFIGURE SHELL-POP KE LIYE DEFAULT SHELL.

;;-----------------------------------[C AND C++ PROGRAMMING]------------------------------------------------------

;; (defun run-after-compile (buffer description)
;;   (message "Buffer %s: %s" buffer description)
;;   (shell-command "./a.out" buffer buffer))

;;(define-key compile-command (kbd "<f6>") 'run-after-compile)

;;(add-hook 'compilation-finish-functions #'run-after-compile)

;;(local-key-binding (kbd "<f6>") 'run-after-compile)

(add-hook 'c-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c-mode-hook #'smartparens-mode)

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
  

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))


;;-----------------------------------[ DISASTER (FOR WATCHING ASSEMBLY CODE IN C/C++)]----------------------------

(use-package disaster
  :ensure t
  :defer t)

;ye mene fxn bnaya ko meri keybinding ko store kr rha hai. [ESE KRNE SE ME PACKAGE KO DEFER KR SKTA HU JO ME 'define-key' ME NAHI KR RHA THA]
(defun my-assembly-code-shower()
  (local-set-key (kbd "C-c a") 'disaster))

(add-hook 'c-mode-hook 'my-assembly-code-shower) ;;yha mene bss 'c-mode' ke hook me apna fxn lga dia aur mast chal rha hai c-major mode me.
(add-hook 'c++-mode-hook 'my-assembly-code-shower) ;;yha mene bss 'c++-mode' ke hook me apna fxn lga dia aur mast chal rha hai c++ major mode me.


;;;---------NEECHE MENE 'DISASTER PACKAKE' KO 'define-key' se set kia tha magar vo kbhi kbhi chlata ni to mene 'add-hook' se fxn bnaya tb mene hook lgaya aur use mene 'c-mode' aur 'c++-mode' me lgaya. 

;; (use-package disaster
;;   :ensure t
;;   :config
;;;;;; (global-set-key (kbd "C-c a") 'disaster)) ;;ise global mat krna kyuki "disaster" file ka actual naam maangta hai to kahi save kro file ko fir run kro keybinding se jo mene "define-key" se bnai hai.

;;   (define-key c-mode-base-map (kbd "C-c a") 'disaster))


;;NOTE 0: YE AADHE TIME CHALTA NI THEEK SE. ISILIYE MENE UPAR ISE AS FXN BANKE HOOK LGAYA HAI.

;;NOTE 1: Me chahta hu ye command run ho "local Major Mode" me jb me file ka naam daal du aur save kru use. Tabhi mene "define-key" se ise bind kia hai. YE COMMAND "SCRATCH-BUFFER" PE NI CHALEGI. BSS CHALEGI JB ME EK "C/CPP" KI FILE BNAKE SAVE KRUNGA USE KAHI PE TBHI CHLAGEI AUR "YE LOCAL KEYBINDING HAI".

;;NOTE 2: Kyuki ye command asal keymap ko chhed rhi hai to use 'DEFER MAT KARNA' kyuki agar defer kra to load hoga ni ye starting me aur me ise use ni kr paunga.

;;NOTE 3: Is package ko defer mat krna kyuki mene "define-key" se bind kia hai keystrokes ko to initially load ni hongi ye agar defer kra mene to.

;;------------------------>>>>>[ QUICKRUN FOR RUNNING C AND C++ PROGRAMS ]<<<<<----------------------------

(use-package quickrun
  :ensure t
  :defer t)

;--->>>[ FOR C++ PROGRAMMING ]

(add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "<f6>") #'quickrun-shell))) ;;ESE LOCAL BINDINGS LGAYI JATI H SPECIFIC MODES PE

;===>>[C++ MODE RELATED SETTINGS ONLY BAAKI JAGAH NI CHALENGI YE SETTINGS BSS C++ MAJOR MODE ME CHALENGI]
;-------------------------------------------------------------------------------------------------
;;Mene C++ me comment aur uncomment krne ke liye remap ki binding jo bss pehle comment krti thi.

(defun my-comment-or-uncomment()
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region))

(add-hook 'c++-mode-hook 'my-comment-or-uncomment) ;; yha mene jo binding change ka fxn lgaya use c++ mode se hook kar diya.
;--------------------------------------------------------------------------------------------------

;;-------------------------------------------------[PYTHON PROGRAMMING]-----------------------------------

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;;NOTE==> To run python program in Emacs use this : M-x elpy-shell-send-region-or-buffer

(use-package anaconda-mode
  :ensure t
  :defer t
  :config
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;;setting the "Can’t guess python-indent-offset" to nil
(setq python-indent-guess-indent-offset nil);;AGAR DIKKAT DE TO USE 't' KAR DENA

(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)

(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "<f6>") 'quickrun-shell)))

;;NOTE::> Mene Anaconda mode daala tha yaha magar shayd error de rha hai vo

;;----------------[LIVE-PY-MODE (Code likhte likhte run krta hai python code ko)]-------------

(use-package live-py-mode
  :ensure t
  :defer t)


;;-----------------------------------------------[MAGIT]----------------------------------------------------------
;;YAHA MANE MAGIT DAALI HAI

(use-package magit
  :defer t)


;;------------------------------------------------[EMOJIFY PACKAGE]--------------------------------------------------------

(use-package emojify
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (emojify-mode 1))))


;;---------------------------------SMEX PACKAGE[M-x YAAD RKHTA HAI PREVIOUSLY TYPED COMMANDS]------------------------------

(use-package smex
  :ensure t
  :defer t)
(smex-initialize)

;;NOTE: Smex package M-x ko sedha replace ni karta bydefault. Use M-x se bind karna padta hai jaise neeche kia hua h mene. 
;;(global-set-key (kbd "M-x") 'smex)
 
;;------------------------------------------------------------------------------------------------------------------------

;(use-package gcmh
;  :config
;  (gcmh-mode 1))
;;------------------------------------------------------------------------------------------------------------------------

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))


;;-------------------------------------------------[COMMON LISP PROGRAMMING]----------------------------------------------
(use-package sly
  :ensure t
  :bind (("<f5>" . sly-eval-defun) ;;ye dono "GLOBALLY" binded commands hai.
	 ("C-c b" . sly-eval-buffer)))
;; :config
;;NOTE: ye dono commands chalengi magar "Scratch-Buffer" me ni chalengi. Name ke saath agar me buffer ko save kru tb hi chlegni local-buffers me ye commands.
  ;; (define-key lisp-mode-map (kbd "<f5>") 'sly-eval-defun) 
  ;; (define-key lisp-mode-map (kbd "C-c b") 'sly-eval-buffer))


 ;NOTE=>> 	 :map lisp-mode-map
	         ;("SPC-e-b" . sly-eval-buffer)))
; YE COMMAND SPACE KEY KE SAATH NI CHAL RHI.



;;(add-hook 'sly-mrepl-mode-hook #'smartparens-mode)

(add-hook 'sly-mrepl-mode-hook 'rainbow-delimiters-mode)

;;(add-hook 'lisp-mode-hook #'smartparens-mode)

(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(setq inferior-lisp-program "/usr/bin/sbcl") ;;<==ye jo line likhi hai mene ye bta rhi hai ki sly ko jo "COMPILER" use karna hai uska path
;;NOTE==> MENE SBCL DOWNLOAD KIA PEHLE ARCH SE AUR FIR YE COMMAND RUN KARI JO UPAR LIKHI HAI.

;;-------------------------------------------------------------------------------------------------------
;;-------------------------------------------[WRITER ROOM PACKAGE]---------------------------------------

(use-package writeroom-mode
  :defer t)


;;-------------------------------------------[System performance dekhne ke liye ek mode hai 'SYMON']------------

(use-package symon
  :ensure t
  :defer t)
  ;; :init ;;ese ye 'symon-mode' ke saath
  ;; (symon-mode t))

;;---------------------------------------------[VTERM PACKAGE]------------------------------------------------

(use-package vterm
  :bind ("C-c v" . vterm))  ;<== yaha mene Vterm ko call directly karne ke liye Shortcut banaya hai.


(setq shell-file-name "/usr/bin/zsh" ;;pehle fish shell tha yha "/usr/bin/fish".
      vterm-max-scrollback 5000)
;NOTE=> YE VTERM PACKAGE CHALNE KE LIYE 'CMAKE' PACKAGE INSTALL KARNA PADTA HAI SHELL SE..[sudo pacman -S cmake]

;;-------------------------[PROJECTILE (For Project Management)]-----------------------------------------------

(use-package projectile
  :init
  (projectile-mode t)                                   ;;Enable this immediately
  :config
  (setq projectile-enable-caching t                     ;; Much better performance on large projects
        projectile-completion-system 'ivy)              ;; Ideally the minibuffer should aways look similar
  :bind-keymap
  ("C-c p" . projectile-command-map))

  
;;---------------------------------[GARBAGE COLLECTION]-------------------------------
;is package se emacs jldi load hota hai
(use-package gcmh
  :config
  (gcmh-mode 1))

(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)


;;--------------------------------[HIGHLIGHT PARENTHESIS MODE]-----------------------

(use-package highlight-parentheses
  :ensure t)   ;;iska mene global mode on kia hai upar 

;;---------------------------------[PACMAN-GAME]-------------------------------------

(use-package pacmacs
  :defer t)

;;-----------------------------[TYPIT (TOUCH TYPE GAME)]----------------------------

(use-package typit
  :ensure t
  :defer t)


;;-----------------[SWIPER-PACKAGE (TO REPLACE BASIC SEARCH ON EMACS)]---------------

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

;;----------------------------------[KILL-RING-POPUPS]--------------------------------

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))
;==> Ye package useful tab h jab mene kaafi saari lines copy maar di ho aur unhe apne hisaab se paste karna ho. Ye popup menu deta hai copied lines ka.

;;----------------------------------[BEACON-MODE]--------------------------------------

(use-package beacon
  :ensure t
  :defer t
  :init
  (beacon-mode 1))

;;================================[EMMS Music Player for Emacs]========================

(use-package emms
  :ensure t
  :defer t
  :config
         (emms-all)
         (emms-default-players)       
	 (emms-source-file-default-directory "~/Music/")
  :bind ("C-c m" . emms-pause))
     
  	 

;; (setq emms-source-file-default-directory "~/Music")

;;-------------------------------[IVY EMMS INTEGRATION]--------------------------------

(use-package ivy-emms
  :ensure t
  :defer t
  :bind (("<C-f5>" . ivy-emms)))


;;-------------------------------[EMMS-MODE-LINE-CYCLE]---------------------------------

(use-package emms-mode-line-cycle
  :ensure t
  :defer t
  :init (emms-mode-line-cycle 1))


;;-------------[WASTEBIN SERVICES TO SHARE CODES AND PNG ETC VIA LINKS]-----------------

(use-package webpaste
  :ensure t
  :defer t
  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
         ("C-c C-p C-r" . webpaste-paste-region)
         ("C-c C-p C-p" . webpaste-paste-buffer-or-region))
  :config
  (setq webpaste-paste-confirmation t)  ;;<<==ye line merese poochegi ki kya yhi region h copy karne ne.
  (setq webpaste-max-retries 13))



;;-------------------------------[FILE MANAGEMENT WITH DIRED]---------------------------

(use-package dired
  :ensure nil
  :bind
  (("C-x C-j" . dired-jump))
  (("C-c C-n" . dired-create-empty-file))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :hook
  (dired-mode . treemacs-icons-dired-mode))
;;NOTE: Mene yha "Dired-jump" ki binding daali h taaki kbhi me agar kisi file pe kaam kr rha hu aur mujhe dekha pde ki directory me ye file kaha h.
;; NOTE: Mene "custom" variable bhi cheeda h taaki mereko pehle directories dikhe aur files baad me.

;;Is package se me dired me konsi file-extension konse program se kholni hai ye set kr skta hu me.
(use-package dired-open
  :ensure nil
  :config
  (setq dired-open-extensions '(("png" . "shotwell")
				("jpg" . "shotwell")
				("mp4" . "vlc")
				("m4a" . "vlc")
				("mkv" . "vlc")
				("avi" . "vlc")
				("epub" . "atril document viewer")
				("pdf" . "evince"))))



;;-------------------------------[SUDO-EDIT (To edit the files using sudo)]------------------------------------

(use-package sudo-edit
  :ensure t
  :defer t
  :bind (("C-c C-r" . sudo-edit)))

;;--------------------------------------[MINIMAP]--------------------------------------------------------------

(use-package minimap
  :ensure t
  :defer t
  :config
  (setq minimap-window-location 'right))


;;-------------------------------------[AUCTEX- EMACS ME TEX AUR LATEX KA SUPPORT]------------------------------

(use-package auctex
  :ensure t
  :defer t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;--------------------------------[YASNIPPET {ye emacs ka snippet making package hai}]----------------------------

(use-package yasnippet
  :ensure t
  :defer t
  :hook
  (emacs-lisp-mode . yas-minor-mode)
  (c-mode . yas-minor-mode)
  (c++-mode . yas-minor-mode))

;;NOTE: "yas-minor-mode" ye bss "yasnippet" package me hai naa ki "yasnippet-snippets" package me. Tbhi mene ise upar likha naa ki neeche.

(use-package yasnippet-snippets
  :ensure t
  :defer t
  :config
  (yas-reload-all))      ;;ya yas-reload-all mene isliye lgaya h kyuki isme ek bug h jo custom snippets ek dum se load ni krta to ye use hata deta hai.


  ;;NOTE: "snippets" saare hai " ~/.emacs.d/elpa/yasnippet-snippets-20220221.1234/snippets ". 

;;ME AB MODES KE HISAAB SE YASNIPPETS KO USE KRUNGA {me asal me yasnippet-global-mode} use ni krna chahta bss.

;; (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)


;; (add-hooks '(((c++-mode c-mode) . 'yas-minor-mode)))

;;------------------------------------------------[VERILOG PROGRAMMING]----------------------------------------------------------------

(setq verilog-linter "/usr/bin/iverilog")

;;-----------------------------------------------------[TREEMACS]----------------------------------------------------------------------
(use-package treemacs
  :ensure t
  :bind
  ("C-<f7>" . treemacs-root-up)
  ("C-<f8>" . treemacs-root-down)
  ([f8] . treemacs)) ;;mene ese bind kia [f8] ko treemacs ko toggle krne ke liye.
  
;;(global-set-key [f8] 'treemacs)

(use-package treemacs-all-the-icons
  :ensure t
  :config
  (treemacs-load-theme "all-the-icons")) ;;yha badalne hai icons...upar wale "treemacs" ke packages me ni.

;;-------------------------------------------------[DASHBOARD-FOR-EMACS]-------------------------------------------------------------

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "--- न जायते म्रियते वा कदाचि- न्नायं भूत्वा भविता वा न भूयः । अजो नित्यः शाश्वतोऽयं पुराणो- न हन्यते हन्यमाने शरीरे ॥ ---
 ==> यह आत्मा किसी काल में भी न तो जन्मता है और न मरता ही है तथा न यह उत्पन्न होकर फिर होने वाला ही है क्योंकि यह अजन्मा, नित्य, सनातन और पुरातन है, शरीर के मारे जाने पर भी यह नहीं मारा जाता॥")
  (setq dashboard-startup-banner "~/.emacs.d/dashboard-banner-pictures/7614_batman-arkham-knight-prev.png")
  (setq dashboard-center-content nil)
  (setq dashboard-items '((recents . 5)
			  (agenda . 5)
			  (projects . 5)
			  (registers . 3)))
	
  :config
  (dashboard-setup-startup-hook))


;;---------------------------------------------[JAVASCRIPT-MODE]-------------------------------------------------

(add-hook 'js-mode-hook (lambda () (local-set-key (kbd "<f6>") 'quickrun)))

(use-package rjsx-mode
  :ensure t
  :defer t
  :mode "\\.js\\'")

;; YE MENE YHA INDIUM DAALA THA JAVASCRIPT KE LIYE MAGAR ABHI COMMENT KIA HUA HAI AUR PACKAGES SE HATAYA BHI HUA HAI.
;; (use-package indium
;;   :ensure t)
;; (add-hook 'js-mode-hook #'indium-interaction-mode)

;;---------------------------------------------[MARK-MULTIPLE]----------------------------------------------------

(use-package mark-multiple
  :ensure t
  :defer t
  :bind
  ("C-c q" . 'mark-all-like-this-in-region)) ;;ye mene pehle bind kia tha "mark-all-like-this" pe to poore buffer me change ho rha tha ab selected region me hoga bss.

;;-----------------------------------[IEDIT (TO MARK MULTIPLE WORD OF SAME NAME) ]-------------------------------

(use-package iedit
  :ensure t
  :defer t)


;;-----------------------------------------------[MULTIPLE CURSORS]----------------------------------------------

(use-package multiple-cursors
  :ensure t
  ;;:defer t
  :config
  (global-set-key (kbd "C-M-y") 'mc/insert-numbers)
  (global-set-key (kbd "C-M-j") 'mc/mark-all-dwim)) ;;ye hai mast multiple cursors ke liye command

  ;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  ;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;;;NOTE: First mark the word, then add more cursors.
;; To get out of multiple-cursors-mode, press <return> or C-g. The latter will first disable multiple regions before disabling multiple cursors. If you want to insert a newline in multiple-cursors-mode, use C-j.

;;---------------------------------------------[RAINBOW-MODE]-----------------------------------------------------

(use-package rainbow-mode
  :ensure t
  :defer t
  :hook
  (prog-mode . rainbow-mode))
;NOTE: YE PACKAGE TB KAAM AATA HAI JB ME COLOR CODE USE KARTA HU TO YE US COLOR CODE KO USKE ASLI COLOR KE SAATH SHOW KREGA.

;;-------------------------------------------[MANAGE-MINOR-MODE]----------------------------------------------------

(use-package manage-minor-mode
  :defer t
  :ensure t)

(use-package manage-minor-mode-table
  :ensure t
  :defer t)

;;================[EMACS' KE PACKAGES KI SETTINGS JO EMACS ME PEHLE SE HI HAI MENE UNHE BSS TWEAK KIA HAI]==============

;;-------------------------------------------[DIARY-FOR-EMACS]-------------------------------------------------------
;;ye package emacs me pehle se hi tha.
(setq diary-file "~/.emacs.d/Diary/diary")

(setq calendar-date-style 'european)
;; (use-package calendar
;;   :ensure nil
;;   :config
;;   (calendar-set-date-style 'european))


;(calendar-set-date-style 'european) ;;calendar-set-date-style ek fxn hai aur 'european ek "SYMNBOL" hai.

;;(setq diary-date-forms diary-european-date-forms)

;;-------------------------------------------[DICTIONARY-IN-EMACS]---------------------------------------------------

(use-package dictionary
  :ensure nil
  :defer t
  :bind
  ("C-c d" . dictionary-search)
  :config
  (setq dictionary-server "dict.org"))
  

;;-----------------------------------------------------------------------------------------------------------------




;;===================================================================================================================
;;-------------------------------------[BONGO (FOR MUSIC LIKE EMMS)]--------------------------------------------------

(use-package bongo
  :ensure t
  :defer t
  :config
  (setq bongo-enabled-backends '(vlc))
 ;;(setq bongo-default-directory "~/Music") ;;isse ni ho rhi load by default music directory by default.
  (bongo-insert-directory "~/Music")) ;;is line se reload ho rhi hai meri music directory bongo me by default.

;;-----------------------[VUNDO ('Undo'command ko tree shape me dikhane ke liye hai ye]-------------------------------

(use-package vundo
  :ensure t
  :defer t
  :bind
  ("C-x u" . vundo)
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

;;-------------------------------------------------[GNU-ELPA-KEYRING-UPDATE]------------------------------------------

(use-package gnu-elpa-keyring-update
  :ensure t
  :defer t)

;;Note: Ye package mujhe help karta hai GNU ELPA ki keyring auto download krne me taaki me bach jaau manually download krne se.

;==========================================[ORG-MODE-SETTINGS-AND-PACKAGES]============================================
;;-------------------------[ORG MODE KI FILES ME EXTRA PADDING DI HAI MENE ISKI HELP SE]-----------

(defun org-mode-ke-liye-padding ()
  (setq visual-fill-column-width 150 ;;agar ise 200 kia to changes observe ni ho payenge.
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(add-hook 'org-mode-hook 'org-mode-ke-liye-padding)

(setq org-edit-src-content-indentation 1) ;;ye variable hai jo source code blocks ke aage spaces khud lgane lgta hai. Iske default value 2 thi. Mene 1 me change ki hai taaki bss 1 hi space aaye.

;;----------------------------------------[ORG-BULLETS]--------------------------------------------
;;YAHA MENE ORG MODE BULLETS DAALA HAI

(use-package org-bullets)

(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))


;;Aur bhi zyada beautify karne ke liye [ORG-SUPERSTAR PACKAGE DAALA HAI MENE]

(use-package org-superstar
  :ensure t
  :config
   (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;;-----------------------------------[ORG MODE CUSTOMIZATIONS]--------------------------------------

(setq org-ellipsis " ▼ "
      org-hide-emphasis-markers t)

(setq org-pretty-entities t) ;; YE LATEST CHHEDA HAI MENE

;; "ORG-MODERN" package se kaafi aachi look aarhi hai "ISE DEFER MAT KARNA"
(use-package org-modern
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook 'org-modern-agenda))

;;------------------------[ORG-MODE KI HEADINGS KO BADA KIA HAI EK USER DEFINED FXN LIKHKE MENE]-------


(defun org-setting-fonts-and-colors-doom-one ()
 ;; "Enable Doom One colors for Org headers."
 ;; (interactive)
  (dolist
      (face
       '((org-level-1 1.5 "#51afef" semi-bold)
         (org-level-2 1.4 "#c678dd" medium)
         (org-level-3 1.4 "#98be65" medium)
         (org-level-4 1.3 "#da8548" medium)
         (org-level-5 1.2 "#5699af" normal)
         (org-level-6 1.1 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font "Khmer OS" :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face))))
   ;(set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

;; (set-face-attribute 'org-level-1 nil :font "Khmer OS" :underline `(:color "#51afef" :style line)) ;;Isse mene bss "Org-level-1" heading ko underline kia tha.

(add-hook 'org-mode-hook 'org-setting-fonts-and-colors-doom-one) ;;YHA MENE FXN BNAKE USE HOOK KR DIA 'ORG MODE' SE TAAKI  JAISE HI ORG MODE CHALE YE SETTINGS BHI CHAL JAYE


;;----------------------------------------------------------------------------------------------------

(use-package org-tempo
  :ensure nil)
;;NOTE:=> YE PACKAGE ORG-MODE ME HAI. MEREKO YE PACKAGE MELPA YA AUR KAHI SE DOWNLOAD NI KARNA TO MENE (use-package org-tempo :ensure nil)
;; KIA END ME.
;;DHYAN RKHNA KI AGAR PACKAGE CHAHIYE DOWNLOAD KARNE KE LIYE. AUR AGAR NI HAI TO DOWNLOAD KARO USKE LIYE YE ':ensure t' LIKHNA PADTA HAI

;;----------------------------------------------------------------------------------------------------------------

(setq org-latex-with-hyperref nil) ;;ye org-mode jo khud by default 'hypersec' bnata hai use ye mene off kia hai.

(setq org-export-allow-bind-keywords t) ;;ye org-tables ko default left side of document pe leke aajata hai. Kyuki default org-tables centre of document pe aati hai.

;;--------------------------------------------[ORG-BABEL-LANGUAGES]---------------------------------------------

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp .t)
   (python . t)
   (C . t) ;;ye mene jab 'C' use kia tb chala 'C or C++'.
   (lisp . t)
   (plantuml . t)))

;ORG-MODE KE SOURCE BLOCKS JO LISP ME HAI UNHE EVALUATE KRNE KE LIYE MENE 'SLY' KO SET KIA HAI YHA
(setf org-babel-lisp-eval-fn 'sly-eval)

(setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar") ;;mene yha "plantuml" ka jar-path set kia hai.


;;------------------------------------------------[ORG-ROAM]-----------------------------------------------------

(use-package org-roam
  :ensure t
  :defer t
  :config
  (setq org-roam-directory "~/Org-Roam-Directory")
  (org-roam-setup)
  :bind
  ("C-c n t" . org-roam-buffer-toggle)
  ("C-c n f" . org-roam-node-find)
  ("C-c n i" . org-roam-node-insert))
  

;;-----------------------------------------------------------------------------------------------------------------------

;;NOTE: Yaha mene apni khud ki LATEX_CLASS bnai hai "org-testing-123-latex" ke naam se. Testing ke liye bnai hai mene magar chal sahi rhi hai.

;;IS POORE CODE KO MENE COMMENT KIA HAI

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-testing-123-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;;----------------------------------------------------------------------------------------------------------------------

;;SETTING FONTS FOR ORG-MODE KI HEADINGS KE LIYE EXCLUSIVELY






;;==================================================================================================================

;;-----------------------------------------------[DISCOVER-MY-MAJOR]-------------------------------------------------

;;NOTE: Ye package mujhe major mode me kon konsi bindings activated hai aur vo kya krti hai sb btata hai ye.

(use-package discover-my-major
  :ensure t
  :defer t
  :bind
  ("C-h M-m" . discover-my-major))

;;-----------------------------------------------[TLDR-MODE]---------------------------------------------------------

(use-package tldr
  :ensure t
  :defer t)

;NOTE: Ye package asal me replacement hai "man" pages ki.
;;--------------------------------------[ELFEED (NEWS READER IN EMACS)]-----------------------------------------------

(use-package elfeed
  :ensure t
  :defer t
  :bind
  ("C-x w" . elfeed)
  :config
  (setq elfeed-feeds '("https://planet.emacslife.com/atom.xml"
		       "https://www.reddit.com/r/linux.rss"
		       "https://www.archlinux.org/feeds/news/"
		       "https://feeds.feedburner.com/TheHackersNews")))

(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup)
  (setq elfeed-goodies/entry-pane-size 0.5)) ;;yha mene elfeed ka reading plane aata hai use 50% of screen pe set kia hai. Pehle 0.75 [75%] tha.


;;NOTE: "elfeed-goodies" is package ko defer mat krna kyuki agar defer kroge to ye fxn "elfeed-goodies/setup" run ni hoga jb me elfeed chalaunga directly.

;;-------------------------------------------------[HASKELL-MODE]-------------------------------------------------------

(use-package haskell-mode
  :ensure t
  :defer t
  :config
  (add-hook 'haskell-mode-hook (lambda () (local-set-key (kbd "<f6>") #'quickrun-shell))))

;;-----------------------------------------------[PLANTUML-MODE]--------------------------------------------------------


(use-package plantuml-mode
  :ensure t
  :defer t
  :config
  (setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar"))

;;==============================[GNUS (NEWS READER HAI EMACS KE LIYE)]===================================================

(use-package gnus
  :ensure nil
  :defer t
  :config
  (setq gnus-select-method '(nntp  "news.gwene.org"))
  (setq gnus-secondary-select-methods '((nnhackernews "")))) ;;Ye package config krne ke liye mujhe ise " '((nnhackernews "")) " ese set kia hai naa ki " '(nnhackernews "")"

;;---------------------------------------[HACKERNEWS SERVER]--------------------------------------------------------------

(use-package nnhackernews
  :ensure t
  :defer t)

;;=======================================================================================================================

;;------------------------------------------[SXIV (PICS VIEWER FOR EMACS)]-----------------------------------------------

(use-package sxiv
  :ensure t)

;;---------------[READ-GUD DEBUGGER] [TRY PHASE ME HAI YE AGAR THEEK SE NAA CHALE TO HATA DENA YE PACKAGE]---------------

(use-package realgud
  :ensure t
  :defer t)


;;-------------------------[SENDING PICS OF CODE VIA CARBON]------------------------------------------------------------
(use-package carbon-now-sh
  :ensure t
  :defer t)

;;---------------------------[SPICE MODE]--------------------
(use-package spice-mode
  :ensure t)

;;---------------------------[SPACELINE]------------------------
;; (use-package spaceline
;;   :ensure t
;;   :defer t;;Hata dena ise agar is package ko use krna hai to
;;   :init
;;   (spaceline-emacs-theme t)
;;   (spaceline-toggle-battery-on))
;;   ;;:config
;;   ;;(setq spaceline-face-func



;; (use-package spaceline-all-the-icons
;;   :ensure t
;;   :defer t ;;Hata dena ise agar is package ko use krna hai to
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-toggle-all-the-icons-battery-status-on)
;;   (setq spaceline-all-the-icons-separator-type 'cup)) ;;ISKO CHANGE KRNA HAI TO BSS USE KRO ['wave, 'slant, 'arrow, 'cup, 'none]

;; ;;---------------[FANCY-BATTERY]------------------------
;; (use-package fancy-battery
;;   :ensure t
;;   :defer t;;Hata dena ise agar is package ko use krna hai to
;;   :init
;;   (fancy-battery-mode)
;;   :config
;;   (setq fancy-battery-show-percentage t))


;;;---------------------------[AG search]
(use-package ag
  :ensure t
  :defer t)
