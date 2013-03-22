#lang racket
(define (square n)
  (* n n)
)

(define (fast-expr-iter a b n)
  (cond(= n 0) 1)
 (cond ((= n  0) 1)
  ((even? n) (square (fast-expr b(/ n 2))))
  (else (* b (fast-expr b (- n 1)))))
)
(define (fast-expr b n)
  (fast-expr-iter b n 1)
)
 
