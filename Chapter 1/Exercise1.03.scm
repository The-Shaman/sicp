(define (square x) (* x x))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (max x y) (if (> x y) x y))

(define (min x y) (if (< x y) x y))

; Takes 3 inputs and returns the sum of squares of the two largest numbers.
(define (sum-of-squares-of-two-largest x y z)
        (sum-of-squares (max x y) (max z (min x y))))
