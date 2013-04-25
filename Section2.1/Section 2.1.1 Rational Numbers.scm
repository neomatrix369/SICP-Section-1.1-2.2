#lang racket

(define (make-rat n d) 
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat(+ (* (numer x) (denom y))
              (* (numer y) (denom x)))
           (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat(- (* (numer x) (denom y))
              (* (numer y) (denom x)))
           (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat(* (numer x) (numer x))
           (* (denom x) (denom y))))

(define (div-rat x y)
  (div-rat(* (numer x) (denom x)
           * (denom y) (numer y))))

(define (equal-rat? x y )
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
  
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))