(* Question 1 *)
fun plus((r1, i1), (r2, i2)) = ((r1+r2), (i1+i2));
val q1 = plus((1,2), (3,4));

(* Question 2 *)
fun times((r1, i1), (r2, i2)) = ((r1 * r2 - i1 * i2), (r1 * i2 + i1 * r2));
val q2 = times((1,2), (3,4));

(* Question 3 *)
fun createUntil(x, y, list) = if x>= y
                              then list
                              else x::createUntil(x +1, y, list);
fun until(x, y) = if x >= y
                  then nil
                  else createUntil(x, y, nil);
val q3 = until (1, 4);

(* Question 4 *)
fun append(_, nil) = nil
  | append(x, list) = (x, hd list)::append(x,tl list);
val q4 = append ( 1, [1, 2, 3]);

(* Question 5 *)
fun pair(nil, list2) = nil
  | pair(list1 , nil) = nil
  | pair(list1, list2) = append(hd list1, list2) @ pair(tl list1, list2);
val q5 = pair ([1,2], [3,4,5]);
