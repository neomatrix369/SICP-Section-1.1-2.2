#lang racket
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc-us amount)
        (cc amount us-coins))

(define (cc-uk amount)
  (cc amount uk-coins))

(define (cc amount coins)
  (cond ((= amount 0) 1) 
        ((or (< amount 0) (= (length coins) 0)) 0)
        (else (+ (cc amount (cdr coins))
               (cc (- amount (car coins)) coins)))))

  