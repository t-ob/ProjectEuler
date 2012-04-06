;;;; Project Euler - Problem 6
;;;; Find the sum of the digits of 2^1000

;;; Solution:

(define sum-digits
  (lambda (n)
    (if (= n 0)
        0
        (+ (remainder n 10)
           (sum-digits (floor (/ n 10)))))))

(sum-digits (fast-expt 2 1000))

