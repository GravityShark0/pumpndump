;;; ../.pumpfiles/home/.doom.d/pomodoro.el -*- lexical-binding: t; -*-
(defun calculate-pomodoro-time (input)
  "Calculate how long it would take for how many pomodoros"
  (interactive "nHow many pomodoros: ")
  (let ((pomodoro 25)
        (shortbreak 5)
        (longbreak 15)
        (longbreakinterval 4)
        (mins 0))
    (dotimes (i input)
      (if (= (% (+ i 1) longbreakinterval) 0)
          (setq mins (+ mins pomodoro longbreak)))
      (setq mins (+ mins pomodoro shortbreak)))
    (let* ((current-time (current-time))
           (time-delta (* mins 60))
           (future-time (time-add current-time (seconds-to-time time-delta)))
           (hours (/ mins 60))
           (remaining-minutes (% mins 60))
           (longing (format "%d:%d" hours remaining-minutes)))
      (print (format "%s long, ends %s" longing (format-time-string "%I:%M%p" future-time))))))
;; How many pomodoros: 9
;; "5:50 long, ends 3:03PM"
