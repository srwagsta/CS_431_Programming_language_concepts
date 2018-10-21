Homework 6: High Order ML Functions
===================================

*Stephen Wagstaff* \
*CS 431* \
*October 18, 2018*

---

1. Write a function `reduce: (’a * ’a -> ’a) -> a’ list -> ’a list` that behaves like `foldl` except that it takes the first element of the list as the initial value. For example, `reduce (op -) [1,2,3]` evaluates to `3 - (2 - 1) = 2`. This method does not apply to empty list.

   ```sml
   fun reduce
   ```

---

**For the rest of the questions, use `zip`, `map`, and `reduce` to solve the problems, where `zip` function is from homework 4. The following questions are about vectors and matrix. We represent row vectors using lists. For example, `[2,3,5,4]` represents a row vector of four integers. We represent a matrix using a list of lists. For example, the matrix**

    1 2 3
    4 5 6

<!-- **is written as `[ [1,2,3], [4, 5, 6] ]`.** -->

---

