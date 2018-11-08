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


val e = Times (Times (Var "x", Var "y"), Plus (Var "x", Const 3));
eval e [("x", 2), ("y", 3)];
val e1 = Pow (Var "x", 4);
eval e1 [("x", 2)];


(* Question 2 *)
fun print (Const constant) = Int.toString constant
  | print (Var variable) = variable
  | print (Plus (exp1, exp2)) = "(" ^ print exp1 ^ " + " ^ print exp2 ^ ")"
  | print (Times (exp1, exp2)) = "(" ^ print exp1 ^ " * " ^ print exp2 ^ ")"
  | print (Pow (exp1, int)) ="(" ^ print exp1 ^ "^" ^ Int.toString int ^ ")";

print e;
print e1;

(* Question 3 *)