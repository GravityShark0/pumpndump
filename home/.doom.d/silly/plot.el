;;; ../.pumpfiles/home/.doom.d/plot.el -*- lexical-binding: t; -*-

(defun plot-polyline-svg (punk depth zoom width height filename)
  (let* (
         (half-width (/ width 2))
         (half-height (/ width 2))
         (svg-header (format "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"%d\" height=\"%d\" viewBox=\"0 0 %d %d\" >\n"
                             width
                             height
                             width
                             height))
         (svg-body "<polyline style=\"stroke:black;stroke-width:3;fill:none\" points=\"")
         (svg-footer "</svg>\n")
         (x 0))

    (while (<= x (/ width zoom))
      (let ((y (- (/ half-height zoom ) (funcall punk (- x (/ half-width zoom))))))
        (if (and (> y 0) (< y (/ height zoom)))
            (setq svg-body
                  (concat svg-body
                          (format "%f,%f " (* x zoom) (* y zoom)))))
        (setq x (+ x depth))))

    (setq svg-body (concat svg-body "\"></polyline>"))
    (with-temp-file filename
      (insert svg-header)
      (insert svg-body)
      (insert svg-footer))))

(defun plot-dots-svg (punk depth zoom width height filename)
  (let* (
         (half-width (/ width 2))
         (half-height (/ width 2))
         (svg-header (format "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"%d\" height=\"%d\" viewBox=\"0 0 %d %d\" >\n"
                             width
                             height
                             width
                             height))
         (svg-body "")
         (svg-footer "</svg>\n")
         (x 0))

    ;; Randomly set points

    (while (<= x (/ width zoom))
      (let ((y (- (/ half-height zoom ) (funcall punk (- x (/ half-width zoom))))))
        (if (and (> y 0) (< y (/ height zoom)))
            (setq svg-body
                  (concat svg-body
                          (format "<circle cx=\"%f\" cy=\"%f\" r=\"1\" fill=\"black\" />\n"
                                  (* x zoom) (* y zoom)))))
        (setq x (+ x depth))))
    (with-temp-file filename
      (insert svg-header)
      (insert svg-body)
      (insert svg-footer))))

(defun plot-dots-wtf-svg (x-min x-max y-min y-max step n-range width height zoom filename)
  (let* ((svg-header (format "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"%d\" height=\"%d\" viewBox=\"0 0 %d %d\" >\n"
                             width
                             height
                             width
                             height))
         (svg-body "")
         (svg-footer "</svg>\n"))

    (dotimes (i (floor (/ (- x-max x-min) step)))
      (let ((x (+ x-min (* i step))))
        (unless (zerop x)  ;; Avoid division by zero
          (dotimes (k (* 2 n-range))
            (let* ((n (- k n-range))
                   (y (/ (* n float-pi) x)))
              (when (and (>= y y-min) (<= y y-max))
                (setq svg-body
                      (concat svg-body
                              (format "<circle cx=\"%f\" cy=\"%f\" r=\"1\" fill=\"black\" />\n"
                                      (+ (* x zoom) (/ width 2))
                                      (+ (* y zoom) (/ height 2)))))))))))

    (with-temp-file filename
      (insert svg-header)
      (insert svg-body)
      (insert svg-footer))))
(defun plot-polyline-wtf-svg (x-min x-max y-min y-max step n-range width height zoom filename)
  (let* ((svg-header (format "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"%d\" height=\"%d\" viewBox=\"0 0 %d %d\" >\n"
                             width
                             height
                             width
                             height))
         (svg-body "<polyline style=\"stroke:black;stroke-width:3;fill:none\" points=\"")
         (svg-footer "</svg>\n"))

    (dotimes (i (floor (/ (- x-max x-min) step)))
      (let ((x (+ x-min (* i step))))
        (unless (zerop x)  ;; Avoid division by zero
          (dotimes (k (* 2 n-range))
            (let* ((n (- k n-range))
                   (y (/ (* n float-pi) x)))
              (when (and (>= y y-min) (<= y y-max))
                (setq svg-body
                      (concat svg-body
                              (format "%f,%f "
                                      (+ (* x zoom) (/ width 2))
                                      (+ (* y zoom) (/ height 2)))))))))))

    (setq svg-body (concat svg-body "\"></polyline>"))
    (with-temp-file filename
      (insert svg-header)
      (insert svg-body)
      (insert svg-footer))))

;; (defun chaos-game-svg (geometry vertices num-points filename)
;;   (let ((svg-header (format "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"%d\" height=\"%d\" viewBox=\"0 0 %d %d\">\n"
;;                             (car geometry)
;;                             (cadr geometry)
;;                             (car gurrent-point) (cadr current-point)))))

;;     ;; Write the SVG content to a file
;;     (with-temp-file filename
;;       (insert svg-header)
;;       (insert svg-body)
;;       (insert svg-footer))))

;; (let (
;;       (geometry '(300 300))
;;       (vertices '((150 50) (50 250) (250 250))))
;;   (chaos-game-svg geometry vertices 10000 "~/sierpinski.svg"))

;; (plot-dots-svg (lambda (x) x) 500 500 "~/punk.svg")
(defun ranco (cap)
  (- (random (* cap 2)) cap))

(defun random-quintic (cap)
  (lambda (x)
    (+
     (* (ranco cap) (expt x 5))
     (* (ranco cap) (expt x 4))
     (* (ranco cap) (expt x 3))
     (* (ranco cap) (expt x 2))
     (* (ranco cap) x)
     (ranco cap))))

(defun arrange (x_min x_max y_min y_max step n_range)
  (let ((coords nil)
        (x x_min))
    (while (<= x x_max)
      (if (/= x 0)
          (dolist (elt (-iota (+ (+ n_range 1) n_range) n_range))
            (let ((y (/ (* elt float-pi) x) ))
              (if (and (<= y_min y) (<= y y_max))
                  (push (list x y) coords)))))
      (setq x (+ x step)))
    coords))

;; (let ((coefficient 8))
;;   (plot-dots-wtf-svg (* (- coefficient) float-pi)
;;                      (* coefficient float-pi)
;;                      (* (- coefficient) float-pi)
;;                      (* coefficient float-pi) 1 100 500 500 10 "~/dotsy.svg"))
;; (plot-polyline-svg (random-quintic 3) 0.001 100 500 500 "~/polyline.svg")
;; (plot-dots-svg (random-quintic 3) 1 1 500 500 "~/dots.svg")
;; (message "Debug: My list is %s" (prin1-to-string (arrange (* -10 float-pi) (* 10 float-pi) (* -10 float-pi) (* 10 float-pi) 0.1 100)))

;; (plot-dots-svg (lambda (x) (expt x 3)) 1 1 500 500 "~/dots1.svg")
;; (plot-dots-svg (lambda (x) (expt x 3)) 0.01 1 500 500 "~/dots0.01.svg")
;; (plot-dots-svg (lambda (x) (float-pi)) 0.01 1 500 500 "~/dots0.01.svg")
;; (plot-dots-svg (lambda (x) (float-pi)) 0.01 1 500 500 "~/dots0.01.svg")

;; (plot-dots-svg (lambda (x) (+ (ranco x 30 3) (expt x 2) x)) 500 500 "~/punk.svg")
;; (plot-dots-svg (lambda (x) (+ (expt x 2) x)) 0.1 500 500 "~/punk.svg")
;; (plot-dots-svg (lambda (x) (+ (expt x 5) (expt x 4) (expt x 3) (expt x 2) x)) 0.01 100 500 500 "~/punk.svg")
;; (plot-dots-svg (lambda (x) x) 1 10 500 500 "~/punk.svg")
;; (random-dots-svg 500 500 10000 "~/rando.svg")
(setq fancy-splash-image "~/punk.svg")
