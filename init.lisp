(in-package :stumpwm)

(set-prefix-key (kbd "s-t"))


;;;
;;; SELF-DEFINED MAPS
;;;

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

(defun pull-current-to-last-frame (group)
  (let ((last-frame (tile-group-last-frame group)))
    (when (and last-frame
               (find last-frame (group-frames group)))
      (pull-window (current-window) last-frame))))

(defcommand (move-other tile-group) () ()
  "pull current into last frame"
  (pull-current-to-last-frame (current-group)))

(define-key *agh2o/window-map* (kbd "O") "move-other")

(define-key *agh2o/window-map* (kbd "s-j") "exchange-direction down")
(define-key *agh2o/window-map* (kbd "s-k") "exchange-direction up")
(define-key *agh2o/window-map* (kbd "s-h") "exchange-direction left")
(define-key *agh2o/window-map* (kbd "s-l") "exchange-direction right")


(define-key *agh2o/window-map* (kbd "v") "hsplit")
(define-key *agh2o/window-map* (kbd "s") "vsplit")
(define-key *agh2o/window-map* (kbd "+") "balance-frames")
(define-key *agh2o/window-map* (kbd "DEL") "repack-window-numbers")

(defcommand agh2o/window-pull ()
  (windows))

(define-key *agh2o/window-map* (kbd "w") "pull-from-windowlist")
(define-key *agh2o/window-map* (kbd "x") "kill")
(define-key *agh2o/window-map* (kbd "q") "delete")

(define-key *agh2o/window-map* (kbd "\"") "windowlist")


;; AGH2O/OPEN-MAP

(define-key *agh2o/open-map* (kbd "e") "emacs")
(define-key *agh2o/open-map* (kbd "c") "exec terminator")
(define-key *agh2o/open-map* (kbd "b") "exec chromium")

;; GROUPS-MAP
(define-key *groups-map* (kbd "g") "grouplist")
(define-key *groups-map* (kbd "s-g") "grouplist")



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


;(setf *message-window-gravity* :top-right)
;(setf *input-window-gravity* :top-right)

(set-font "-b&h-lucidatypewriter-medium-r-normal-sans-11-80-100-100-m-70-iso10646-1")
;(set-bg-color "black")
;(set-fg-color "antiquewhite")
;(set-border-color "lightgreen")
(set-unfocus-color "darkgray")
(setf *window-border-style* :thin)

(set-fg-color "GreenYellow")
(set-bg-color "#001921")
(set-msg-border-width 1)
(set-border-color "#001921")
(setf *message-window-padding* 50)
(setf *message-window-gravity* :top
      *input-window-gravity* :top)

;;;;;
;;;;; MODELINE
;;;;;

;(load-module "battery-portable")
;(load-module "wifi")
;(load-module "maildir")
;; "[^B%n^b] %W"
;; "%n%s%t"
;; "%m%n%s%50t"
;; "%a %b %e %k:%M:%S"

;;(load-conf-file "kb-layout.lisp")

(setf *bar-med-color* "^B^8")
(setf *bar-hi-color* "^B^3")
(setf *bar-crit-color* "^B^1")

(setf *colors*
      '("black"
        "red"
        "green"
        "yellow"
        "blue"
        "magenta"
        "cyan"
        "white"
        "GreenYellow"
        "#009696"))

(update-color-map (current-screen))

(setf *group-format* " %t ")
;; (setf *window-format* "%m%50t ")
(setf *window-format* "%m%n%s%20t ")
(setf *mode-line-timeout* 1)

(setf *time-modeline-string* "^9 • %e, %a^n^B %l:%M ^b")

(defun get-date-modeline ()
  (stumpwm:run-shell-command
   (format nil "date +\"~A\""
           *time-modeline-string*) t))

(defun get-layout-modeline ()
  (if (= 0 (get-current-layout))
      "^3 en ^n"
      "^3^R ru ^r^n"))


(defvar jabber-message-count "0")

(setf jabber-message-count "0")

(defun get-jabber-message-count ()
  (if (equal "0" jabber-message-count)
      " • "
      (format nil "^R ~A ^r" jabber-message-count)))


(setf *screen-mode-line-format*
      (list "^B^3 %g ^n^b %W ^> "
            ;; '(:eval (get-layout-modeline))
            "  "
            ;; "^3%M^n"
            ;; '(:eval (get-jabber-message-count))
            "%I "
            "^B^2^n^b%B "
            '(:eval (get-date-modeline))))


(setf *mode-line-border-width* 0)
(setf *mode-line-background-color* "#000809")
(setf *mode-line-foreground-color* "DeepSkyBlue")

(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen)
                      (current-head)))


;;;;;
;;;;; END MODELINE
;;;;;
