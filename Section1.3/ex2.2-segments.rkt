#lang racket
; Exercise 2.2.  Consider the problem of representing line segments in a plane.
; Each segment is represented as a pair of points: a starting point and an ending point. 

(require "../common.rkt")

(define (make-point x y )
  (cons x y))

(define (get-x p)
  (car p))

(define (get-y p)
  (cdr p))

(define (make-segment start-p end-p)
  (cons start-p end-p))

(define (get-start segment)
  (car segment))

(define (get-end segment)
  (cdr segment))
  
(define (get-midpoint segment)
  (let ((start-x (get-x (get-start segment)))
       (end-x   (get-x (get-end segment)))
       (start-y (get-y (get-start segment)))
       (end-y (get-y (get-end segment))))
    (make-point  (/ (+ start-x end-x) 2.0)
                 (/ (+ start-y end-y) 2.0)))) 

(test "make-point" 
     (λ ()
       (assert "x is car" (car (make-point -5 7)) -5)
       (assert "y is cdr" (cdr (make-point -5 7)) 7)
       (assert "is pair" (pair? (make-point -5 7)) #t)))

(test "get-x"
      (λ ()
        (assert-simple (get-x (make-point -5 7)) -5)))

(test "get-y"
      (λ ()
        (assert-simple (get-y (make-point -5 7)) 7)))

(define (with-data)
  (define p1 (make-point 3.0 4.0))
  (define p2 (make-point 6.0 7.0))
  (test "make-segment" 
      (λ ()
          (assert "start is car" (car (make-segment p1 p2)) p1)
          (assert "end is cdr" (cdr (make-segment p1 p2)) p2)))
  (test "get endpoints"
      (λ ()
          (assert "start" (get-start (make-segment p1 p2)) p1)
          (assert "end" (get-end (make-segment p1 p2)) p2)))
  (test "mid-point" 
      (λ ()
        (assert "x of midpoint" (get-x (get-midpoint (make-segment p1 p2))) 4.5)
        (assert "y of midpoint" (get-y (get-midpoint (make-segment p1 p2))) 5.5)
        (assert "y of midpoint" (get-end (make-segment p1 p2)) p2))))

(with-data)