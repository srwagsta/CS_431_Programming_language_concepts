(* Question 1 *)
fun merge_sort _ nil = nil
  | merge_sort _ (x::nil) = x::nil
  | merge_sort f list = 
  let
    fun split list = 
      let
        val cut = (length list) div 2
      in
        ( List.take (list,cut) , List.drop (list,cut) )
    end;

    fun merge (nil, remaining) = remaining
      | merge (remaining, nil) = remaining
      | merge ((left as lh::l), (right as rh::r)) = 
      if f(lh, rh)
      then lh::merge (l, right)
      else rh::merge (left,r);
    val (left, right) = split list
  in
    merge ((merge_sort f left), (merge_sort f right))
  end;

merge_sort (op >) [0, 5, 1, ~4, 9, 11];

(* Question 2 *)
fun selection_sort _ nil = nil
  | selection_sort _ (x::nil) = x::nil
  | selection_sort f (first::last) =
    let
      fun select_r small ([], output) = small::(selection_sort f output)
      |   select_r small (x::xs, output) =
            if (f(x, small)) then
              select_r x (xs, small::output)
            else
              select_r small (xs, x::output)
    in
      select_r first (last, [])
    end;

selection_sort (op >) [0, 5, 1, ~4, 9, 11]

(* Question 3 *)