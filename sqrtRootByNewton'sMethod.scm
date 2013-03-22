#lang racket
; square-root function
(define (sqrt x)
  (sqrt-iter 1.0 x))

; sqrt-iter function
(define (sqrt-iter guess x) 
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

; good-enough function
(define (good-enough? guess x) 
  (< (abs (- (square guess) x)) 0.001))

; abs function
(define (abs x)
  (if (> x 0) 
       x
       (- x)
  )
)

; improve function
(define (improve guess x) 
  (average guess (/ x guess)))

; average function
(define (average x y)
  (/ (+ x y) 2))

; square function
(define (square x) (* x x))