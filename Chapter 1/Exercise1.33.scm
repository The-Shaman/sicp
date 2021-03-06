(define (filtered-accumulate predicate? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
	(if (predicate? a)
	    (iter (next a) result)
            (iter (next a) (combiner a result)))))
  (iter a null-value))

(define (filtered-accumulate-recursive predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a) (term a) null-value)
       (filtered-accumulate predicate? combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-of-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (identity x) x)

(define (product-of-relative-prime n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))
