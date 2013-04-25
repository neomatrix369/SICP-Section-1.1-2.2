#lang racket

(define tolerance 0.0001)

(define (fixed-point f first-guess)
   (define (close-enough? v1 v2)
     (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
 (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x)
     (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
   (fixed-point (newton-transform g) guess))

; square
(define (square x) (* x x))

; cube
(define (cube x) (* x x x))

; sqr root
; y ==> y2 - x
(define (sqrt x)
  (newtons-method (lambda (y) (- square y) x))
                   1.0)
; cubic
; x ==> x3 + ax2 + bx + c
(define (cubic a b c)
  (lambda (x) (+ (cube x)
                  (* a (square x))
                  (* ppb  x)
                  c)))

(define (solved-f a b c) 
  (newtons-method (cubic a b c) 1.0))
