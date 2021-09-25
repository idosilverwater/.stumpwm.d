(in-package :stumpwm)
(ql:quickload "cl-ppcre")

(set-prefix-key (kbd "s-t"))

;;;
;;; SELF-DEFINED MAPS
;;;

(defvar *agh2o/window-map* (make-sparse-keymap))
(defvar *agh2o/open-map* (make-sparse-keymap))
(defvar *agh2o/connect-map* (make-sparse-keymap))

(defparameter *en-to-he-symkey* (make-hash-table :test 'equal))

(setf (gethash "t" *en-to-he-symkey*) "hebrew_aleph")
(setf (gethash "c" *en-to-he-symkey*) "hebrew_beth")
(setf (gethash "d" *en-to-he-symkey*) "hebrew_gimmel")
(setf (gethash "s" *en-to-he-symkey*) "hebrew_daleth")
(setf (gethash "v" *en-to-he-symkey*) "hebrew_he")
(setf (gethash "u" *en-to-he-symkey*) "hebrew_waw")
(setf (gethash "z" *en-to-he-symkey*) "hebrew_zayin")
(setf (gethash "j" *en-to-he-symkey*) "hebrew_het")
(setf (gethash "y" *en-to-he-symkey*) "hebrew_teth")
(setf (gethash "h" *en-to-he-symkey*) "hebrew_yod")
(setf (gethash "l" *en-to-he-symkey*) "hebrew_finalkaph")
(setf (gethash "f" *en-to-he-symkey*) "hebrew_kaph")
(setf (gethash "k" *en-to-he-symkey*) "hebrew_lamed")
(setf (gethash "o" *en-to-he-symkey*) "hebrew_finalmem")
(setf (gethash "n" *en-to-he-symkey*) "hebrew_mem")
(setf (gethash "i" *en-to-he-symkey*) "hebrew_finalnun")
(setf (gethash "b" *en-to-he-symkey*) "hebrew_nun")
(setf (gethash "x" *en-to-he-symkey*) "hebrew_samekh")
(setf (gethash "g" *en-to-he-symkey*) "hebrew_ayin")
(setf (gethash ";" *en-to-he-symkey*) "hebrew_finalpe")
(setf (gethash "p" *en-to-he-symkey*) "hebrew_pe")
(setf (gethash "m" *en-to-he-symkey*) "hebrew_zadi")
(setf (gethash "e" *en-to-he-symkey*) "hebrew_kuf")
(setf (gethash "r" *en-to-he-symkey*) "hebrew_resh")
(setf (gethash "a" *en-to-he-symkey*) "hebrew_shin")

(defun define-key-he (map key command)
  (if (gethash key *en-to-he-symkey*)
      (define-key map (kbd (gethash key *en-to-he-symkey*)) command))
  (define-key map (kbd key) command))




;;;
;;; TOP LEVEL 
;;;

;; MAPS
(define-key *top-map* (kbd "s-w") '*agh2o/window-map*)
(define-key *top-map* (kbd "s-r") '*agh2o/open-map*)
(define-key *top-map* (kbd "s-g") '*groups-map*)
(define-key *top-map* (kbd "s-c") '*agh2o/connect-map*)

;; NAVIGATION
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
(define-key *top-map* (kbd "s-M-n") "next")
(define-key *top-map* (kbd "s-M-p") "prev")

(define-key *top-map* (kbd "s-o") "fother")
(define-key *top-map* (kbd "s-o") "fother")

;; WINDOW
(define-key *top-map* (kbd "s-f") "fullscreen")

(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")

(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-O") "move-other")

(define-key *top-map* (kbd "s-M-j") "exchange-direction down")
(define-key *top-map* (kbd "s-M-k") "exchange-direction up")
(define-key *top-map* (kbd "s-M-h") "exchange-direction left")
(define-key *top-map* (kbd "s-M-l") "exchange-direction right")

;; UTILS
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-e") "exec")
(define-key *top-map* (kbd "s-:") "eval")

(define-key *top-map* (kbd "s-i") "exec keynav")

(define-key *top-map* (kbd "s-b") "banish")
(define-key *top-map* (kbd "s-E") "loadrc")
(define-key *top-map* (kbd "s-C-l") "exec xlock")


(setf stumpwm:*screen-mode-line-format*
      (list "%w | "
            '(:eval (stumpwm:run-shell-command "date" t))))

(define-key *top-map* (kbd "s-m") "mode-line")


(defun eval-python (statement)
  "evaluate python statement"
  (let ((command (concatenate 'string "python -c \"print(" statement ")\"")))
    (stumpwm:run-shell-command command t)))

(defcommand run-python (python-statement) ((:string ": "))
  "get python statement and evaluate"
  (echo python-statement)
  (let* ((result (eval-python python-statement)))
    (echo result)))




;;;
;;; MAPS
;;;


;; AGH2O/WINDOW-MAP


(define-key-he *agh2o/window-map* "n" "fnext")
(define-key *agh2o/window-map* (kbd "p") "fprev")
(define-key *agh2o/window-map* (kbd "o") "fother")
(define-key *agh2o/window-map* (kbd "f") "fselect")
(define-key *agh2o/window-map* (kbd "f") "fselect")
(define-key *agh2o/window-map* (kbd "r") "remove")
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

(defcommand (send-space-other tile-group) () ()
  "type space in other window (to stop youtube playing in other)"
  (let* ((cur-win (current-window))
         (last-frame (tile-group-last-frame (current-group)))
         (wins (frame-windows (current-group) last-frame))
         (current-window-in-frame (first wins)))
    (focus-window current-window-in-frame)
    (window-send-string "k" current-window-in-frame)
    (focus-window cur-win)))

(define-key *agh2o/window-map* (kbd "SPC") "send-space-other")

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
(setf *window-format* "%m%n%s%100t ")
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

;;; start audio
;(setf *key-codes*
;  '((162 . "XF86AudioPlay")       ; handled by amarok (or other mp3 players)
;    (164 . "XF86AudioStop")
;    (144 . "XF86AudioPrev")
;    (153 . "XF86AudioNext")
;    (160 . "XF86AudioMute")
;    (174 . "XF86AudioLowerVolume")     ; we use amixer (alsa mixer) to  handle this
;    (176 . "XF86AudioRaiseVolume"))
;
;;; Map keycodes to keysyms
;(mapcar (lambda (pair))
;    (let* ((keycode (car pair)))
;     (keysym  (cdr pair))
;     (format-dest nil)
;     (format-dest (make-array 5 :fill-pointer 0 :adjustable t :element-type 'character)
;      (format format-dest "xmodmap -e 'keycode ~d = ~a'" keycode keysym)
;      (run-shell-command format-dest))
;    format-dest
;  *key-codes*)

(defun get-volume ()
  "Get current volume"
  (run-shell-command "bash -c \"pactl increase volumelist sinks | grep '^[[:space:]]Volume:' | head -n $(( 0 + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'\"" T))

(defcommand decrease-volume () ()
  "decrease volume"
  (run-shell-command "pactl set-sink-volume 0 -5%")
  (echo (get-volume)))

(defcommand increase-volume () ()
  "increase volume"
  (run-shell-command "pactl set-sink-volume 0 +5%")
  (echo (get-volume)))

(defcommand toggle-mute () ()
  "increase volume"
  (run-shell-command "exec pactl set-sink-mute 0 toggle"))



(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioLowerVolume") "decrease-volume")
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioRaiseVolume") "increase-volume")
(define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioMute") "toggle-mute")



(defcommand connect-to-bluetooth-device () ()
  "connect-to-bluetooth-device"
  (let* ((device-list-str (run-shell-command "bluetoothctl devices" t))
         (device-list (cdr (split-string
                            ;; #\NewLine       ;
                            device-list-str)))
         (selected-device-str (select-from-menu (current-screen) device-list))
         (selected-mac (ppcre:register-groups-bind (mac-addr)
                                                   ("\\s([\\S]+)" selected-device-str :sharedp t)
                                                   mac-addr)))
    (run-shell-command (concatenate 'string "bluetoothctl connect " selected-mac)))

  (define-key *agh2o/connect-map* (kbd "b") "connect-to-bluetooth-device"))
