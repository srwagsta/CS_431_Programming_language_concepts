datatype 'data tree =
    Empty
  | Node of 'data tree * 'data * 'data tree;

(* Question 1 *)
fun isFull Empty = true
  | isFull (Node(Empty, _, Node _)) = false
  | isFull (Node(Node _, _, Empty)) = false
  | isFull (Node(leftTree, _, rightTree)) = (isFull leftTree) andalso (isFull rightTree);

(* Question 2*)
fun makeBST nil _ = Empty
  | makeBST [x] _ = Node(Empty, x, Empty)
  | makeBST (x::y::list) comparisonFunction = 
    if (comparisonFunction(x,y))
    then Node((makeBST [y] comparisonFunction), x, (makeBST (list) comparisonFunction))
    else Node((makeBST (list) comparisonFunction), x, (makeBST [y] comparisonFunction));

makeBST [1,2,3,4,5] (op <);