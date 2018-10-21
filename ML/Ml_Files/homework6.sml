fun zip (nil, _) = nil
  | zip (_, nil) = nil
  | zip (h1::list1, h2::list2) = (h1, h2) :: zip (list1, list2);

(* Question 1 *)
fun reduce _ nil = raise Fail "Empty list passed."
  | reduce _ (first::nil) = first
  | reduce f (first::second::rest) = f(reduce f rest, first);

reduce(op -) [1,2,3];


(* Question 2 *)
fun vectorAdd(nil, nil) = nil
  | vectorAdd(nil, l2) = l2
  | vectorAdd(l1, nil) = l1
  | vectorAdd(l1, l2) = map (fn (x, y) => x + y) (zip(l1,l2));

vectorAdd ([1,2,3], [4,5,6]);

(* Question 3 *)
fun svProduct (_, nil) = nil
  | svProduct (mult, list) = map (fn y => mult * y) list;

svProduct(2, [1,2,3]);

(* Question 4 *)
fun vmProduct(rowVector, matrix) = 
  reduce vectorAdd (map (fn (x, list) => svProduct(x, list)) (zip(rowVector, matrix)));
(* TODO: Finish out this function, it has a logical error *s)
vmProduct([1,2,3], [[1,1], [2,1], [3,1]]);