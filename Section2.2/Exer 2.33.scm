#lang racket
; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; test
(accumulate + 0 (list 1 2 3 4 5))
 
; map
(define (myMap p sequence)
  (accumulate (lambda (x y) (cons (p x) y) ) null sequence))

(define sqr (lambda(x) (* x x)))
; test
(myMap sqr (list 1 2 3 4 5))

; append
(define (myAppend seq1 seq2)
  (accumulate cons seq1 seq2))
; test
(myAppend (list 1 2 4) (list 4 5 6))

; length
(define (myLength sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
; test
(myLength (list 1 2 4))