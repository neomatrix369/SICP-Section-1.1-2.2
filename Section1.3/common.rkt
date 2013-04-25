#lang racket

(define (log . vars)
  (display vars)
  (display #\newline)) 

(define (assert-true value1 value2 predicate error-message)
  (if (predicate value1 value2)
      (log "OK")
      (and 
       (printf "~a ~a ~a ~a" "ERROR!" value1 error-message value2)
       (display #\newline)))
)

(define (assert message value1 value2)
  (display (mk-string (list "\t" message " ")))
  (assert-true value1 value2 equal? "did NOT equal")
)

(define (assert-simple value1 value2)
  (assert "" value1 value2))

(define (assert-equals value1 value2)
  (assert-simple value1 value2))

(define (assert-not message value1 value2)
  (display (mk-string (list "\t" message " ")))
  (assert-true value1 value2 (lambda(x y) (not (equal? x y))) "did equal"))
  
(define (mk-string xs)
  (define (concat-with-space x y)
    (string-append (string-append x " ") y))
    (fold-left xs concat-with-space ""))

(define (fold-left xs f seed)
  (if (null? xs)
      seed
      (f seed (fold-left (cdr xs) f (car xs))))) 

(define (test name f)
  (display name)
  (display #\newline) 
  (f)
)

(provide log assert-true assert-simple assert-equals assert assert-not test)