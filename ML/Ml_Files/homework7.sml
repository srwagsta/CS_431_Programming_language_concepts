datatype ’data tree =
  Empty |
  Node of ’data tree * ’data * ’data tree;

(* Question 1 *)
fun isFull