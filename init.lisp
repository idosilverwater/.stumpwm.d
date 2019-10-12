(in-package :stumpwm)

(set-prefix-key (kbd "s-t"))


(defvar *agh2o/frame-map* (make-sparse-keymap))

;;;
;;; TOP LEVEL 
;;;

;; MAPS
(define-key *top-map* (kbd "s-f") '*agh2o/frame-map*)
(define-key *top-map* (kbd "s-g") '*groups-map*)

;; NAVIGATION
(define-key *top-map* (kbd "s-n") "pull-hidden-next")

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
