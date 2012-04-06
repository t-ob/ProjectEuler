;;;; Project Euler - Problem 48
;;;; Find the last ten digits of the sum of nth powers of n for n = 1,
;;;; 2, ... 1000

(define range
  (lambda (a b)
    (if (> a b)
        '()
        (cons a (range (+ a 1) b)))))

(define expmod
  (lambda (base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m)) m))
          (else
           (remainder (* base (expmod base (- exp 1) m)) m)))))

(remainder (foldl +
                  0
                  (map (lambda (x) (expmod x x 10000000000))
                       (range 1 1000)))
           10000000000)
