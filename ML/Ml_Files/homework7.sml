datatype 'data tree =
    Empty
  | Node of 'data tree * 'data * 'data tree;

(* Question 1 *)
fun isFull Empty = true
  | isFull (Node(Empty, _, Node _)) = false
  | isFull (Node(Node _, _, Empty)) = false
  | isFull (Node(leftTree, _, rightTree)) = (isFull leftTree) andalso (isFull rightTree);

(* Question 2*)