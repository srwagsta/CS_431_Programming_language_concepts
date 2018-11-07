datatype exp = Const of int
             | Var of string
             | Plus of exp * exp
             | Times of exp * exp
             | Pow of exp * int;

(* Question 1 
fun eval Var(variable) context = lookup context variable
  | eval expression context =
  0;

  *)


fun lookup nil _ = raise Fail "Variable lookup failed: Empty lookup context passed."
  | lookup [(key, value)] searchKey = 
    if key = searchKey 
    then value
    else raise Fail "Variable lookup failed: Search key not found in passed context."
  | lookup ((key, value)::rest) searchKey =
    if key = searchKey 
    then value
    else lookup rest searchKey;


fun pow(int1, 0) = 1
  | pow(int1, int2) = 
      if int2 > 0
      then int1 * pow(int1, (int2-1))
      else raise Fail "Unsupported operation, can not raise to negative value.";

pow(2,4);