#lang racket

; Exercise 2.18 Define a procedure reverse that takes a list as argument and returns a list of the same 
; elements in reverse order:
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(require "common.rkt")

(define (reverse l)
  (define (reverse0 l acc)
    (if (null? l)
        acc
        (reverse0 (cdr l) (cons (car l) acc))))
  (reverse0 l (list)))
        
(define (reverse-with-append l)
  (if (null? l)
      l
      (append (reverse-with-append (cdr l)) (list (car l)))))

; Exercise 2.27.  Modify your reverse procedure of exercise 2.18 to produce a deep-reverse 
; procedure that takes a list as argument and returns as its value the list with its elements reversed and with all 
;s ublists deep-reversed as well. For example,
; (define x (list (list 1 2) (list 3 4)))
; (reverse x)
; ((3 4) (1 2))
; (deep-reverse x)
; ((4 3) (2 1))

(define (deep-reverse l)
  (define (deep-reverse0 l acc)
    (cond 
     [(null? l) acc]  
     [(pair? (car l))  (deep-reverse0 (cdr l) (cons (deep-reverse (car l)) acc))]        
     [else (deep-reverse0 (cdr l) (cons (car l) acc))]))
  (deep-reverse0 l null))
                        
(define (reverse-test-cases reverse-function)
  (λ () 
  (assert "integer list" (reverse-function (list 1 2 3)) (list 3 2 1))
  (assert "string list" (reverse-function (list "a" "b" "c")) (list "c" "b" "a"))
  (assert "1 element list" (reverse-function (list 1)) (list 1))
  (assert "empty list" (reverse-function null) null)))
  
(test "reverse list" (reverse-test-cases reverse))
(test "reverse list with append" (reverse-test-cases reverse-with-append))
(test "reverse acceptance test"  
       (λ () 
      (assert "flat" (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))
      (assert "nested" (reverse (list (list 1 2) (list 3 4))) (list (list 3 4) (list 1 2)))))
(test "deep-reverse works for flat list" (reverse-test-cases deep-reverse))   
(test "deep-reverse" 
      (λ () 
        (assert "(x x) (x x)" (deep-reverse (list (list 1 2) (list 3 4))) (list (list 4 3) (list 2 1)))
        (assert "(x (x x)" (deep-reverse (list 1 (list 2 3))) (list (list 3 2) 1))
        (assert "((x x) x)" (deep-reverse (list (list 1 2) 3)) (list 3 (list 2 1)))
        (assert "((x) (x) (x))" (deep-reverse (list (list 1) (list 2) (list 3))) (list (list 3) (list 2) (list 1)))))
(test "shallow reverse does not deep-reverse"
      (λ ()
        (assert-simple (reverse (list (list 1 2) (list 3 4))) (list (list 3 4) (list 1 2)))))
(test "deep-reverse acceptance" 
      (λ ()
        (assert-simple (deep-reverse (list (list 1 2) (list 3 4))) (list (list 4 3) (list 2 1)))))

