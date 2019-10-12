(in-package :stumpwm)

(set-prefix-key (kbd "s-t"))


(defvar *agh2o/frame-map* (make-sparse-keymap))
(defvar *agh2o/window-map* (make-sparse-keymap))
(defvar *agh2o/open-map* (make-sparse-keymap))

;;;
;;; TOP LEVEL 
;;;

;; MAPS
(define-key *top-map* (kbd "s-f") '*agh2o/frame-map*)
(define-key *top-map* (kbd "s-w") '*agh2o/window-map*)
(define-key *top-map* (kbd "s-r") '*agh2o/open-map*)
(define-key *top-map* (kbd "s-g") '*groups-map*)

;; NAVIGATION
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-o") "fother")

;; UTILS
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-!") "exec")
(define-key *top-map* (kbd "s-:") "eval")



;;;
;;; MAPS
;;;

;; AGH2O/FRAME-MAP

(define-key *agh2o/frame-map* (kbd "n") "fnext")
(define-key *agh2o/frame-map* (kbd "p") "fprev")
(define-key *agh2o/frame-map* (kbd "o") "fother")
(define-key *agh2o/frame-map* (kbd "R") "remove")

;; AGH2O/WINDOW-MAP

(define-key *agh2o/window-map* (kbd "j") "move-focus down")
(define-key *agh2o/window-map* (kbd "k") "move-focus up")
(define-key *agh2o/window-map* (kbd "h") "move-focus left")
(define-key *agh2o/window-map* (kbd "l") "move-focus right")

(define-key *agh2o/window-map* (kbd "J") "move-window down")
(define-key *agh2o/window-map* (kbd "K") "move-window up")
(define-key *agh2o/window-map* (kbd "H") "move-window left")
(define-key *agh2o/window-map* (kbd "L") "move-window right")

(define-key *agh2o/window-map* (kbd "s") "hsplit")
(define-key *agh2o/window-map* (kbd "v") "vsplit")

(define-key *agh2o/window-map* (kbd "\"") "windowlist")


;; AGH2O/OPEN-MAP

(define-key *agh2o/open-map* (kbd "e") "emacs")
(define-key *agh2o/open-map* (kbd "c") "exec gnome-terminal")
(define-key *agh2o/open-map* (kbd "b") "exec chromium")
