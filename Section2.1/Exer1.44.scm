#lang racket

; some constants
(define dx 0.001)
(define (f x) (+ x 2.0))

; implementation of function f
(define (callSmooth)
  ((smooth f) 5.0)
)

; smooth function
(define (smooth f)
  (lambda (x) (/ (+ (f(- x dx)) (f x) (f(+ x dx))) 3.0))
)

; repeated
