#lang racket
; format 1
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

; format 2
(define (abs x) 
  (cond ((< x 0) (- x))
   else (else x)))

; format 3
; if (<predicate> <consequent> <alternative>)
(define (abs x)
  (if (< x 0) 
      (- x)
      x))