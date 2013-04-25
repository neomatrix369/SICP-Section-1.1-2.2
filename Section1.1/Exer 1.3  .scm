#lang racket
(define (threeNumbers x y z)
  (if (> x y)
   (
    and (> y z) 
        (sum-of-squares y z)
   )
   (else (if (> x z)
           and  (> y z) 
           (sum-of-squares x y)
          (else
           (if(1 (sum-of-squares x z))
           )
          )
         )
   )
  )
)
   

; sum of squares
(define (sum-of-squares x y) 
  (+ (square x) (square y)))

; square a number
(define (square x) (* x x))

