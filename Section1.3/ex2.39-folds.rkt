#lang racket

; Exercise 2.39. Complete the definitions of reverse (exercise 2.18) in terms of fold-right 
; and fold-left 
(require "common.rkt")

(define (fold-left op initial sequence)
  (if (null? sequence)
      initial
      (fold-left op (op initial (car sequence)) (cdr sequence))))
;
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) 
          (fold-right op initial (cdr sequence)))))

(define (reverse-with-fold-right sequence)
  (fold-right (lambda (x xs) (append xs (list x))) null sequence))

(define (reverse-with-fold-left sequence)
  (fold-left (lambda (xs x) (cons x xs)) null sequence))
      
(define (sum-testcase fold-function name)
 (test name 
  (λ()
    (assert "list of 3 elemements with seed 0" (fold-function + 0 (list 1 2 3)) 6)
    (assert "empty list" (fold-function + 6 null ) 6)
    (assert "one-element list" (fold-function + 5 (list 2)) 7)
    (assert "list of strings" (fold-function string-append "" (list "1" "2" "3")) "123"))))
    
(sum-testcase fold-left "sum with fold-left")
(sum-testcase fold-right "sum with fold-right")

(define (reverse-testcase reverse-function name)
  (test name
        (λ()
          (assert "3 elements list" (reverse-function (list 1 2 3)) (list 3 2 1))
          (assert "2 elements list" (reverse-function (list 1 2)) (list 2 1))
          (assert "reversed empty list is an empty list" (reverse-function null) null))))


(reverse-testcase reverse-with-fold-left "reverse with fold-left")
(reverse-testcase reverse-with-fold-right "reverse with fold-right")


