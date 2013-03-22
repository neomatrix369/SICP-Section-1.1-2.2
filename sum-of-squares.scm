#lang racket
; return square of a number
(define (square x) (* x x))

; return sum of the squares of a number
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; example of a compound procedure 
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))f 