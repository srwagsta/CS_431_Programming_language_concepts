Control.Print.printDepth := 1024;

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
  | makeBST (currentElement::list) comparisonFunction =
  let
    fun insert element Empty = Node (Empty, element, Empty)
      | insert element (Node(left, current, right)) = 
          if comparisonFunction(element, current)
          then Node((insert element left), current, right)
          else Node(left, current, (insert element right))
  in
    insert currentElement (makeBST list comparisonFunction)
  end;

makeBST [1,3,2] (op <);

(* Question 3 *)
fun searchBST Empty _ _ = false
  | searchBST (Node(left, current, right)) comparisonFunction element =
  if current = element 
  then true 
  else
    if comparisonFunction(element, current)
    then searchBST left comparisonFunction element
    else searchBST right comparisonFunction element;

val t = Node( Node( Empty, 4, Empty ),5,Node( Empty, 6, Empty ));
searchBST t (op <) 4;
val t2 = makeBST [3, 6, 2, 1, 4] (op <);
searchBST t2 (op <) 2;
searchBST t2 (op <) 5;
