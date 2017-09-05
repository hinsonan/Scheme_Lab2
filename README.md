# Scheme_Lab2

Scheme Problems

1.Define a Scheme function called circle-area that will calculate the area of a circle. The function will be passed the radius of the circle.  (A = π*r2)

2.Write a Scheme function called miles-to-nautical that will convert statute miles to nautical miles and a function called mph-to-knots

        1 nautical mile = 1.15 statute miles
        1 knot = 1.15077945 mile per hour

        >(miles-to-nautical 100)
        86.95652173913044 
 
3.Just in case we ever make a conversion to the metric system, we need to define the Scheme function kilometers-to-nautical that will convert kilometers to nautical miles.


        	1 statute mile = 1.6093 km
 
          >(kilometers-to-nautical 100)
          53.99684691946033

4.Define a Scheme function called hypotenuse, which takes two arguments. The two arguments are numbers, which represent the lengths of the legs of a right triangle. The function returns a number representing the length of the hypotenuse of the right triangle.

Your answer should be a decimal, NOT a fraction.
    	
    >(hypotenuse 3 4)
          5
          >(hypotenuse 9 16)
          18.35755975068582

5.The following formulas convert from Celsius  to Fahrenheit and conversely.

      C = (F + 40) * 5/9 - 40
      F = (C + 40) * 9/5 – 40

Write two Scheme conversion functions, F-TO-C and C-TO-F, using these formulas. Each function takes exactly one argument. The F-TO-C function takes a number representing a temperature in Fahrenheit and returns a number representing the same temperature in Celsius. The C-TO-F function takes a number representing a temperature in Celsius and returns a number representing the same temperature in Fahrenheit.
 
6.Write a Scheme function called reverse-digits, which will take in an integer (positive or negative) and return it as an integer with the digits reversed. The sign should not be changed. (Hint: Use remainder and quotient.)

    > (reverse-digits 123)
          321
          > (reverse-digits -42)
          -24


7.Write a function called my-nth that is passed an integer n and a list, and returns the nth element of the list (first element is 1). If n is outside the valid range, return false.


    	> (my-nth 1 '(a b c))
    	a
    	> (my-nth 3 '(a b c))
    	c


8.Write a function called find-element that will search through a list and return the position of the element if it exists or false if it doesn't. Assume the first element is index 0.


    	>(find-element 'a '(b c d e a))
    	5
    	>(find-element '(a) '(b (c) d (a) f))
    	4
    	>(find-element 'z '())
    	false

9.Write a Scheme function called find-first-coordinate that will search through a list of 2-element lists (ordered pairs) for the second coordinate and will return the first coordinate if such an ordered pair is found or false if it is not found.

      >(find-first-coordinate ‘a   ‘((c z) (r a) (b d))) 
      r
      >(find-first-coordinate ‘e   ‘((c z) (r a) (b d))) 
      false

10.Write a Scheme function called conditional-remove that takes a list and an element and returns a list with the last element removed if it equals the element passed in as a parameter. If the list does not end in the element passed as a parameter, the list is returned.    	


      >(conditional-remove 'a '(b c d e a g a))
    	(b c d e a g)
      >(conditional-remove 'a '(b c d e a g))
            (b c d e a g)


11.Write a Scheme function called is-palindrome? that takes an atom and determines if it is a palindrome (i.e., the same forwards and backwards). The comparison should be case-insensitive (i.e., case does NOT matter). The built-in functions string->list and char-downcase may be useful.  	

      >(is-palindrome? 12321)
            true
        >(is-palindrome? “racecar”)
            true
            >(is-palindrome? “mom”)
            true
      >(is-palindrome? “Mammam”)
            true
      >(is-palindrome? “Yo Momma”)
            false
        >(is-palindrome? “rats live on no evil star” )
        true

12.Write a Scheme function called is-perfect-number? that takes an integer and returns true if the number is perfect (i.e., the sum of its divisors except itself is the number). For example 6 is a perfect number. Its divisors are {1, 2, 3, 6}. Excluding itself the sum of 1, 2, and 3 is 6.    	

    >(is-perfect-number? 6)
          true
          >(is-perfect-number?  7)
          false



13.Write a Scheme function called range-to-letter-count that takes two integers between -2^32 and 2^32 and counts the number of letters in all the english words of the numbers in the range (inclusive). If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

Don’t use “and” or hyphens when converting integers to words. For example,  167 should be written as “one hundred sixty seven”    

      >(range-to-letter-count 1 4)
            15
            >(range-to-letter-count 1 1)
            3


14.Write a Scheme function called evaluatable? that takes a list and determines if the list can be evaluated as a Scheme program. 

      >(evaluatable? 6)
            true
            >(evaluatable? ‘(+ 2 4))
            true
            >(evaluatable? ‘( evaluatable? (+ 2 4)) )
            true
            >(evaluatable? ‘(blah blah 4)) )
            False

15.Write a Scheme function called balanced-divs? that takes a list and determines if the list can be evaluated as a Scheme program. 

      >(balanced-divs? (“<div>”  “<h1>” “text” “</h1>”   ))

