#lang racket

(define (vector . l) l)
(vector 5 6)

(define (matrix . vectors) (list vectors))
(matrix (vector 1 2) (vector 3 4))

(define (matrix-*-vector m v)
  accumulate(lambda (x)))