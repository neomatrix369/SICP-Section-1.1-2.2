#lang racket

(define (make-segment start end) (cons start end)) 
(define (start-segment start) (car start))
(define (end-segment end) (cdr end))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment line-segment)
   (cons (/ (+ (x-point (start-segment line-segment))
               (y-point (start-segment line-segment)))
            2)
         (/ (+ (x-point (end-segment line-segment))
               (y-point (end-segment line-segment)))
            2)
   ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))