;;;; Project Euler - Problem 2
;;;; Find the largest prime divisor of 600851475143.

;;; Solution:
;;; Construct list of prime divisors of an integer n by computing the
;;; least prime p dividing n and its exponent e, and recursing on n/p^e.

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define square
  (lambda (x) (* x x)))

(define (fast-expt-iter b index a)
  (cond ((= index 0) a)
        ((even? index) (fast-expt-iter (square b) (/ index 2) a))
        (else (fast-expt-iter b (- index 1) (* a b)))))

(define (fast-expt b index)
  (fast-expt-iter b index 1))

(define prime-divisors
  (lambda (n)
    (if (= n 1)
        '()
        (let ((factor (smallest-divisor n)))
          (cons factor
                (prime-divisors (/ n
                                   (fast-expt factor
                                              (exponent n factor)))))))))

(define test-int 600851475143)

(car (reverse (prime-divisors test-int)))
