#lang racket

(define (shallow-reverse-list xs) 
    (define (reverse-help ys ac)
      (if (null? ys) 
          ac
          (reverse-help (cdr ys) (cons (car ys) ac))))
  (reverse-help xs null))


(define (deep-reverse-list xs) 
    (define (reverse-help ys ac)
      (if (null? ys) 
          ac
          (reverse-help (cdr ys) 
                        (cons (if (list? (car ys))
                                  (deep-reverse-list (car ys))
                                  (car ys))
                               ac))))
  (reverse-help xs null))
