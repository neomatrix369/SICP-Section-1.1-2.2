#lang racket

; Exercise 2.33.  Fill in the missing expressions to complete the following definitions of some basic list-
; manipulation operations as accumulations: map, append, length

(require "common.rkt")

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x xs) (cons (p x) xs)) null sequence))

(define (legth sequence)
  (accumulate (lambda (x y) (x + 1) 0 sequence)))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (same sequence)
  (accumulate (lambda (x xs) (cons x xs)) null sequence))

(test "accumulate-based operations"
      (λ ()
        (assert "same" (same (list 1 2 3 4)) (list 1 2 3 4))
        (assert "map with add-1" (map (lambda (x) (+ x 1)) (list 1 2 3)) (list 2 3 4))
        (assert "map with identity" (map (lambda (x) x) (list 1 2 3)) (list 1 2 3))
        (assert "length" (length (list 1 2 3 4 5)) 5)
        (assert "length of empty list" (length null) 0)
        (assert "length of one-element list" (length (list "a")) 1)
        (assert "append" (append (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))
        (assert "append empty list" (append (list 1 2 3) null) (list 1 2 3))
        (assert "append to empty list" (append  null (list 1 2 3)) (list 1 2 3)))) 


