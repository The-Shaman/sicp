; A recursive function that returns the value on the row variable row and col variable column of Pascal's triangle.
(define (pascal row col)
	(cond ((< row col) #f)
	((or (= 0 col) (= row col)) 1)
	(else (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1))))))
