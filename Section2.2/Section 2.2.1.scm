#lang racket
(define (last-pair list) 
  (let ((listlen (length list)))
   (list-ref list (- listlen 1))
  )
)

