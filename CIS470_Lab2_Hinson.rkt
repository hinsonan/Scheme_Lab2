#lang racket
 (require html)
;1
(define(circle-area r)
  (* 3.14159 (* r r))
  )
(circle-area 2)

(newline)

;2
(define(miles-to-nautical x)
  (* x 0.868976)

)

(define(mph-to-knots x)
  (* x 0.868976)
)

(miles-to-nautical 100)

(mph-to-knots 100)

(newline)

;3
(define (kilometers-to-nautical kilos)
  (if (> kilos 0)
      (* 0.539957 kilos)
      0
      )
  )

(kilometers-to-nautical 100)


(newline)

;4
(define (hypotenuse leg-one leg-two)
  (cond ((= leg-one 0) "This is not a valid triangle")
        ((= leg-two 0) "This is not a valid triangle")
        (else (sqrt (+ (* leg-one leg-one) (* leg-two leg-two)))
      )
  )
)
(hypotenuse 9 16)


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
  (cond ((null? l) "The index is out of bounds")
        ((= n 1)(car l))
        (else (my-nth (- n 1)(cdr l)))
  )
  )

(my-nth 8 '(1 2 3 4 45 8 9 27 201 20))


(newline)

;8
(define (find-element x l)
  (if (null? l)
      #f
      (if (equal? (car l) x)
          1
          (if (= (find-element x (cdr l)) -1)
              #f
              (+ 1 (find-element x (cdr l)))))))

(find-element '4 '(4 8 15 16 23 42))

(newline)

;9
(define (find-first-coordinate n liOne)
  (cond ((null? liOne) #f)
    ((equal? n (cadar liOne)) (caar liOne))
    (else (find-first-coordinate n (cdr liOne)))
        
 ))
(find-first-coordinate 'z   '((c z) (r a) (b d)))

(newline)

;10
(define (conditional-remove n liOne)
  (define (looping-funct n liOne)
    (cond
        ((not(equal? n (car liOne))) (reverse liOne))
        (else (reverse (cdr liOne)))
  
  ))
  (looping-funct n (reverse liOne))
  )

(conditional-remove 'a '(b c d e a g a a))

(newline)

;11
(define (is-palindrome? x)
  (if (number? x)
      (let((num (string->list(number->string x))))
        (equal? num (reverse num)))
      (let ((chars (string->list(string-downcase x))))
                (equal? chars (reverse chars)))))



(is-palindrome? "mom")
    
(is-palindrome? "racecar")
  
(is-palindrome? "Fat")

(newline)

;12
(define (is-perfect-number? n)
  (let loop ((i 1)
             (sum 0))
    (cond ((= i n)
           (= sum n))
          ((= 0 (modulo n i))
           (loop (+ i 1) (+ sum i)))
          (else
           (loop (+ i 1) sum)))))

(is-perfect-number? 6)
(is-perfect-number? 7)

(newline)

;13
(define (n2t n)
  (define 1to19     '("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve"
                          "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"))
  (define multof10  '("twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))
  (define thousands '("thousand" "million" "billion" "trillion" "quadrillion" "quintillion" "sextillion" "septillion" "octillion" "nonillion" "decillion" "undecillion"))
  (cond
    ((= n 0) '("zero"))  ; zero is a special case since from now on all 0 will be suppressed
    ((< n 0) (cons "minus" (n2t (- n))))
    (else
     (let loop ((n n) (units thousands) (res '()))
       (cond
         ; --- below 1000
         ((= n 0)    res)
         ((< 0 n 20) (cons (list-ref 1to19    (- n 1)) res))
         ((< n 100)  (cons (list-ref multof10 (- (quotient n 10) 2))
                           (loop (remainder n 10) '() res)))
         ((< n 1000) (loop (quotient n 100)
                           '()
                           (cons 'hundred (loop (remainder n 100) '() res))))
         (else
          ; --- 1000 and above
          (let ((q   (quotient n 1000))
                (res (loop (remainder n 1000) thousands res)))
            (if (zero? q)
                res
                (loop q (cdr units) (cons (car units) res))))))))))

(define (range-to-letter-count upper-bound lower-bound)
  (define acc 0)
  (define (iteration upper-bound lower-bound acc)
(if (> upper-bound 0)
    (set! acc (+ acc (string-length(car(n2t upper-bound)))))
    (set! acc (+ acc (string-length(car(n2t (abs upper-bound))))))
    )
    ;(set! acc (+ acc (string-length(car(n2t upper-bound)))))
    (if (> upper-bound lower-bound)
        (iteration (- upper-bound 1) lower-bound acc)
        acc
        )
    )
  (iteration upper-bound lower-bound acc)
  )

(range-to-letter-count 5 -1)


(newline)

;14
;For some reason this only works down in the interaction window
(define (atom? x) (not (or (pair? x) (null? x))))

(define (evaluatable? lst)
  (cond (list? lst) (atom? lst))
      (if (null? lst)
          #f
          (with-handlers ([exn:fail? (lambda (exn) '#f)])
            (eval lst)
              #t
          ))
     )


(evaluatable? 6)
;true
(evaluatable? '(+ 2 4))
;true
(evaluatable? '( evaluatable? (+ 2 4)) )
;true
(evaluatable? '(blah blah 4)) 
;False

(newline)


;15

(define (string-split str)

  (define (char->string c)
    (make-string 1 c))

  (define (string-first-char str)
    (string-ref str 0))

  (define (string-first str)
    (char->string (string-ref str 0)))

  (define (string-rest str)
    (substring str 1 (string-length str)))

  (define (string-split-helper str chunk lst)
  (cond 
    [(string=? str "") (reverse (cons chunk lst))]
    [else
     (cond
       [(char=? (string-first-char str) #\space) (string-split-helper (string-rest str) "" (cons chunk lst))]
       [else
        (string-split-helper (string-rest str) (string-append chunk (string-first str)) lst)]
       )
     ]
    )
  )

  (string-split-helper str "" empty)
  )


(define (balanced-divs? html-parse)
  (set! html-parse (string-split html-parse))
  (define acc 0)

  
  (define (iteration lst acc)
    (cond
      ((null? lst)(answer acc))
      ((equal? (car lst) "<div") (set! acc (+ acc 1)))
      ((equal? (car lst) "<div>") (set! acc (+ acc 1)))
      ((equal? (car lst) "</div>") (set! acc (- acc 1)))
      )
    (if (not(null? lst))
        (iteration (cdr lst) acc)
        (answer acc)
        )

    )
(define (answer acc)
  (if (= acc 0)
        #t
        #f
        )
  )
  (iteration html-parse acc)
  )


(balanced-divs?  "<div class=”container”> <h1> Heading 1 </h1> <nav> nav items </nav> <div class=”main”>  </div> </div>")
