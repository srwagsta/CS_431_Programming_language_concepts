datatype exp = Const of int
             | Var of string
             | Plus of exp * exp
             | Times of exp * exp
             | Pow of exp * int;

(* Question 1 *)
fun eval (Var variable) context =
      let
        fun lookup nil _ = raise Fail "Variable lookup failed: Empty lookup context passed."
          | lookup [(key, value)] searchKey = 
            if key = searchKey 
            then value
            else raise Fail "Variable lookup failed: Search key not found in passed context."
          | lookup ((key, value)::rest) searchKey =
            if key = searchKey 
            then value
            else lookup rest searchKey
      in
        lookup context variable
      end
  | eval (Const(constant)) context = constant
  | eval (Plus(exp1, exp2)) context = 
      (eval exp1 context) + (eval exp2 context)
  | eval (Times(exp1, exp2)) context =
      (eval exp1 context) * (eval exp2 context)
  | eval (Pow(exp1, int)) context = 
      let
        fun pow(int1, 0) = 1
          | pow(int1, int2) = 
              if int2 > 0
              then int1 * pow(int1, (int2-1))
              else raise Fail "Unsupported operation, can not raise to negative value."
      in
        pow((eval exp1 context), int)
      end;


(* Question 2 *)
fun print (Const constant) = Int.toString constant
  | print (Var variable) = variable
  | print (Plus (exp1, exp2)) = "(" ^ print exp1 ^ " + " ^ print exp2 ^ ")"
  | print (Times (exp1, exp2)) = "(" ^ print exp1 ^ " * " ^ print exp2 ^ ")"
  | print (Pow (exp1, int)) ="(" ^ print exp1 ^ "^" ^ Int.toString int ^ ")";


(* Question 3 *)
fun deriv (Const _) _ = Const 0
  | deriv (Var variable) dx = if variable = dx then Const 1 else Const 0
  | deriv (Plus (exp1, exp2)) dx = Plus((deriv exp1 dx), (deriv exp2 dx))
  | deriv (Times (exp1, exp2)) dx = Plus(Times((deriv exp1 dx), exp2), Times(exp1, (deriv exp2 dx)))
  | deriv (Pow (exp1, int)) dx = Times(Times(Const int, Pow(exp1, int-1)), (deriv exp1 dx));


(* Question 4 *)
fun simplify expression =
  let
    fun attemptRootSimplifcation (Times(Const 1, x)) = x
      | attemptRootSimplifcation (Times(x, Const 1)) = x
      | attemptRootSimplifcation (Times(Const 0, _)) = Const 0
      | attemptRootSimplifcation (Times(_, Const 0)) = Const 0
      | attemptRootSimplifcation (Plus(Const 0, x)) = x
      | attemptRootSimplifcation (Plus(x, Const 0)) = x
      | attemptRootSimplifcation (Pow(x, 1)) = x
      | attemptRootSimplifcation (Pow(_, 0)) = Const 1
      | attemptRootSimplifcation exp = exp;

    fun doSimplification (Const x) = Const x
      | doSimplification (Var x) = Var x
      | doSimplification (Times(exp1, exp2)) = attemptRootSimplifcation(Times((doSimplification (attemptRootSimplifcation exp1)), (doSimplification(attemptRootSimplifcation exp2))))
      | doSimplification (Plus(exp1, exp2)) = attemptRootSimplifcation(Plus((doSimplification (attemptRootSimplifcation exp1)), (doSimplification(attemptRootSimplifcation exp2))))
      | doSimplification (Pow(exp, int)) = attemptRootSimplifcation(Pow(doSimplification(attemptRootSimplifcation exp),int));
  in
    doSimplification expression
  end;


(* Tests *) 
(* Added for more expressive output while testing the makeBST function *)
Control.Print.printDepth := 1024;
(* Setup *)
val e = Times (Times (Var "x", Var "y"), Plus (Var "x", Const 3));
val e1 = Pow (Var "x", 4);
val e2 = Pow (Plus (Var "x", Const 0), 2);

(* Question 1 *)
eval e [("x", 2), ("y", 3)];
eval e1 [("x", 2)];

(* Question 2 *)
print e;
print e1;

(* Question 3 *)
print (deriv e "x");
print (deriv e1 "x");
print e2;

(* Question 4 *)
print (simplify (deriv e "x"));
print (simplify (deriv e1 "x"));
print (simplify e2);