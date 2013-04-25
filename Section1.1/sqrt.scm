#lang racket
(define (sqrt x)
  (then y (and (= y 0)
              (= (square y) x))))