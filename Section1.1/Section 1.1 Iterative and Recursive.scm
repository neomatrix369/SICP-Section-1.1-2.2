#lang racket

; f(n) = n if n <= 3
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)

; recursive
(define ((f-recursive n)
        (if (<= n 3)
            n
            (f (+ (f-recursive (- n 1)) 
                  (* 2 (f-recursive (- n 2)))
                  (* 3 (f-recursive (- n 3)))
               )
            )
        )
      )
)
; linear iterative

(define (f-iterative n)    
   ((f-iter 1 2 3 n))
)

(define (f-iter a b c n)
  (cond ((>= n 3) n)
      ((= n counter) a)
      (else (f-iter b c (+ c (* 2 b) (* 3 a) (+  1 counter) )
      f-iter(1 2 3 n)
  )
)