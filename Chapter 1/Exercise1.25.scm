(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
;This works but only up to a certain point because unlike the original expmod, it doesn't evaluate one step at a time meaning that it uses huge numbers rather than "normal" sized numbers.

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start-range end-range)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) end-range)
      (cond ((> start-range end-range)
             (newline) (display "done"))
            (else (timed-prime-test start-range)
                  (search-for-primes (+ 2 start-range) end-range)))))

(search-for-primes 10000000000 10000000090)
