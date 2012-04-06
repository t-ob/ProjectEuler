;;;; Project Euler - Problem 4

;;; Find the largest 6-digit palindrome that is the product of two
;;; three-digit numbers.

(define make-palindrome
  (lambda (arglist)
    (horner-eval 10
                 (append arglist
                         (reverse arglist)))))

(define (horner-eval x coefficient-sequence)
  (foldl (lambda (this-coeff higher-terms)
           (+ this-coeff
              (* x higher-terms)))
         0
         coefficient-sequence))
