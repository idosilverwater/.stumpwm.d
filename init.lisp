(in-package :stumpwm)

(set-prefix-key (kbd "s-t"))



(defvar *agh2o/window-map* (make-sparse-keymap))
(defvar *agh2o/open-map* (make-sparse-keymap))

;;;
;;; TOP LEVEL 
;;;

;; MAPS
(define-key *top-map* (kbd "s-w") '*agh2o/window-map*)
(define-key *top-map* (kbd "s-r") '*agh2o/open-map*)
(define-key *top-map* (kbd "s-g") '*groups-map*)

;; NAVIGATION
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-o") "fother")

;; WINDOW
(define-key *top-map* (kbd "s-f") "fullscreen")

;; UTILS
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-!") "exec")
(define-key *top-map* (kbd "s-:") "eval")

(define-key *top-map* (kbd "s-b") "banish")
(define-key *top-map* (kbd "s-e") "loadrc")
(define-key *top-map* (kbd "s-l") "exec xlock")



;;;
;;; MAPS
;;;


;; AGH2O/WINDOW-MAP

(define-key *agh2o/window-map* (kbd "n") "fnext")
(define-key *agh2o/window-map* (kbd "p") "fprev")
(define-key *agh2o/window-map* (kbd "o") "fother")
(define-key *agh2o/window-map* (kbd "f") "fselect")
(define-key *agh2o/window-map* (kbd "R") "remove")

(define-key *agh2o/window-map* (kbd "j") "move-focus down")
(define-key *agh2o/window-map* (kbd "k") "move-focus up")
(define-key *agh2o/window-map* (kbd "h") "move-focus left")
(define-key *agh2o/window-map* (kbd "l") "move-focus right")

(define-key *agh2o/window-map* (kbd "J") "move-window down")
(define-key *agh2o/window-map* (kbd "K") "move-window up")
(define-key *agh2o/window-map* (kbd "H") "move-window left")
(define-key *agh2o/window-map* (kbd "L") "move-window right")

(define-key *agh2o/window-map* (kbd "C-j") "exchange-direction down")
(define-key *agh2o/window-map* (kbd "C-k") "exchange-direction up")
(define-key *agh2o/window-map* (kbd "C-h") "exchange-direction left")
(define-key *agh2o/window-map* (kbd "C-l") "exchange-direction right")


(define-key *agh2o/window-map* (kbd "v") "hsplit")
(define-key *agh2o/window-map* (kbd "s") "vsplit")
(define-key *agh2o/window-map* (kbd "+") "balance-frames")
(define-key *agh2o/window-map* (kbd "DEL") "repack-window-numbers")

(define-key *agh2o/window-map* (kbd "x") "kill")
(define-key *agh2o/window-map* (kbd "q") "delete")

(define-key *agh2o/window-map* (kbd "\"") "windowlist")


;; AGH2O/OPEN-MAP

(define-key *agh2o/open-map* (kbd "e") "emacs")
(define-key *agh2o/open-map* (kbd "c") "exec terminator")
(define-key *agh2o/open-map* (kbd "b") "exec chromium")



;;;
;;; Undefine Key Bindings
;;;

(undefine-key *root-map* (kbd ";"))
(undefine-key *root-map* (kbd "!"))
(undefine-key *root-map* (kbd ":"))

(undefine-key *root-map* (kbd "g"))
(undefine-key *root-map* (kbd "x"))

(undefine-key *root-map* (kbd "c"))
(undefine-key *root-map* (kbd "C-c"))
(undefine-key *root-map* (kbd "e"))
(undefine-key *root-map* (kbd "C-e"))

(undefine-key *root-map* (kbd "TAB"))
(undefine-key *root-map* (kbd "M-TAB"))
(undefine-key *root-map* (kbd "o"))
(undefine-key *root-map* (kbd "f"))

(undefine-key *root-map* (kbd "Up"))
(undefine-key *root-map* (kbd "Down"))
(undefine-key *root-map* (kbd "Right"))
(undefine-key *root-map* (kbd "Left"))
(undefine-key *root-map* (kbd "M-Up"))
(undefine-key *root-map* (kbd "M-Down"))
(undefine-key *root-map* (kbd "M-Right"))
(undefine-key *root-map* (kbd "M-Left"))

(undefine-key *root-map* (kbd "F11"))

