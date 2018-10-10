(* Question 1 *)
fun zip (nil, _) = nil
  | zip (_, nil) = nil
  | zip (h1::list1, h2::list2) = (h1, h2) :: zip (list1, list2);
zip ([1, 2, 3], [4, 5]);

(* Question 2 *)
fun unzip(nil) = (nil, nil)
  | unzip((leftElement, rightElement)::list) = 
  let
    val (leftList, rightList) = unzip(list)
  in
    (leftElement::leftList, rightElement::rightList)
  end;
unzip [(1,2), (3,4), (5,6)];

(* Question 3 *)
fun zip3 (nil, _, _) = nil
  | zip3 (_, nil, _) = nil
  | zip3 (_, _, nil) = nil
  | zip3 (h1::list1, h2::list2, h3::list3) = (h1, h2, h3) :: zip3 (list1, list2, list3);
zip3 ([1, 2, 3], [4, 5], [6,7,8]);

 (* Question 4 *)
fun unzip3(nil) = (nil, nil, nil)
  | unzip3((leftElement, centerElement, rightElement)::list) = 
  let
    val (leftList, centerList, rightList) = unzip3(list)
  in
      (leftElement::leftList, centerElement::centerList, rightElement::rightList)
  end;
unzip3 [(1,2,3), (4,5,6), (7,8,9)];

(* Question 5 *)
fun zipWithIndex (list) =
  let
    fun zipWithIndexHelper(nil, _) = nil
      | zipWithIndexHelper(x::list, counter) = (counter, x)::zipWithIndexHelper(list, counter+1)
  in
    zipWithIndexHelper(list, 0)
  end;
zipWithIndex ["a", "b", "c"];

(* Question 6 *)
fun flatten (nil) = nil
  | flatten (x::list) = x @ flatten(list);
flatten ([[1,2], [3], [4,5,6]]);

(* Question 7 *)
fun flatten2 (nil) = nil
  | flatten2 ((e1, e2)::list) = e1::e2::flatten2(list); 
flatten2 [(1,2), (3,4), (5,6)];