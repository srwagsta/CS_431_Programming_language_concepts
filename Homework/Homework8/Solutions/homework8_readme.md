Homework 8: Derivation of arithmetic expressions
================================================

*Stephen Wagstaff* \
*CS 431* \
*November 1, 2018*

---

You will use the following algebraic data types defined for arithmetic expressions.

  ```SML
  datatype exp = Const of int
               | Var of string
               | Plus of exp * exp
               | Times of exp * exp
               | Pow of exp * int;
  ```

For example, the variable `e` as defined `val e = Times (Times (Var "x", Var "y"), Plus (Var "x", Const 3));` represents the expression `(x×y)×(x+ 3)`.  The variable `e1` as defined `val e1 = Pow (Var "x", 4);` represents the expression `x`<sup>4</sup>. 
  The following are some rules for derivations.

  dc/dx = 0   -> where `c` is a constant \
  dx/dx = 1 \
  dy/dx = 0   -> where y != x \
  d(u+v)/dx = du/dx + dv/dx \
  d(u×v)/dx = (du/dx) * v + u * (dv/dx) \
  d(u<sup>n</sup>)/dx = n * u<sup>n−1</sup> * (du/dx)

  ---

1. Implement a function `eval : exp -> (string * int) list -> int` to evaluate an arithmetic expression with a context for the variables in the expression. A context is a list of string and integer tuples. For example `eval e [("x", 2), ("y", 3)]` evaluates to `30` because `(x*y)*(x+3)` is `(2 * 3)*(2 + 3) = 6 * 5 = 30`. Also, `eval e1 [("x", 2)]` evaluates to `16` because `x`<sup>4</sup> is `2`<sup>4</sup>`= 16`. For this `eval` function, you also need helper function `lookup` to look up the value of a variable in a context and `pow` function to calculate the power expression. For example `pow(2,4)` should return `16`. The variable look-up is allowed to fail.

    ```SML
    fun
    ```

2. Implement a function `print: exp -> string` to convert an arithmetic expression to its `string` representation. For example, `print e` should return the string `"((x * y) * (x + 3))"` and `print e1` should return the string `"(x^4)"`.
  
    ```SML
    fun print
    ```

3. Implement a function `deriv: exp -> string -> exp` that takes an arithmetic expression `u` and a string `x` and return the derivative du/dx. Note that the second parameter of the function deriv is a variable as string. For example, `print (deriv e "x")` should return`"((((1 * y) + (x * 0)) * (x + 3)) + ((x * y) * (1 + 0)))"` while print `(deriv e1 "x")` should return `"((4 * (x^3)) * 1)"`.

    ```SML
    fun deriv
    ```

4. Implement a function `simplify: exp -> exp` to simplify an arithmetic expression as much as possible. For example, `print (simplify (deriv e "x"))` should return `"((y * (x + 3)) + (x * y))"` while `print (simplify (deriv e1 "x"))` should return `"(4 * (x^3))"` Also, if `val e2 = Pow (Plus (Var "x", Const 0), 2)`, then `print e2` should return `"((x + 0)^2)"` while `print (simplify e2)` should return `"x^2"`. \
  Hint: for this question, you may want to define a helper function `simp` to simplify obvious expressions. `simp(e×0)` = `0` , `simp(e×1)` = `e`, `simp(e+0)` = `e`, etc. The function `simplify` should call `simp` after recursively calls itself on components of `plus`, `times`, and `pow` expressions.

    ```SML
    fun simplify
    ```
