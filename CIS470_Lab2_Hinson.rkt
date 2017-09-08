#lang racket

;1
(define(circle-area r)
  (* 3.14159 (* r r))
  )
(circle-area 2)

(newline)

;2
(define(miles-to-nautical x)
  (* x 1.15)

)

(define(mph-to-knots x)
  (* x 1.15077945)
)

(miles-to-nautical 100)

(mph-to-knots 100)

(newline)

;3
(define(kilometers-to-nautical x)
  (* 1.6093 x)
)
(kilometers-to-nautical 100)

(newline)

;4
(define (hypotenuse x y)
  (sqrt(+ (* x x) (* y y)))
  )
(hypotenuse 3 4)

;5
(define(F-TO-C x)
 (- (* (+ x 40) (/ 5 9)) 40)
  )

(define(C-TO-F x)
 (- (* (+ x 40) (/ 9 5)) 40)
  )

(F-TO-C 20)
(C-TO-F 20)

(newline)
;6
(define (reverse-digits n)
  (let loop ((n n) (r 0))
    (if (zero? n) r
        (loop (quotient n 10) (+ (* r 10) (remainder n 10))))))

(reverse-digits 345)

(newline)

;7
(define (my-nth n l)
  (if (or (> n (length l)) (< n 1))
    (error "false")
    (if (eq? n 1)
      (car l)
      (my-nth (- n 1) (cdr l)))))

(my-nth 3 '(1 4 5 6))

;8
