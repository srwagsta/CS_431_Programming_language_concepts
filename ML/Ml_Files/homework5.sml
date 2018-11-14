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
  | selection_sort f list = 
    let
      fun select nil = nil
        | select [x] = [x]
        | select (firstElement::list) = 
          let
            val (testElement::remaining) = select(list)
          in
            if(f(testElement,firstElement)) 
            then select(testElement::firstElement::remaining) 
            else firstElement::testElement::remaining
          end;
    in 
      select list
    end;

selection_sort (op >) [0, 5, 1, ~4, 9, 11];

(* Question 3 *)
fun insertion_sort _ nil = nil
  |	insertion_sort f list = 
  let 
    fun insert x nil = [x]
      |	insert x (head::rest) = 
        if f(x,head)
        then x::head::rest
        else head::(insert x rest)
    fun sort sofar nil = sofar
      | sort sofar (element::list) = 
        insert element (sort sofar list)  
  in
    sort nil list
  end;

insertion_sort (op >) [0, 5, 1, ~4, 9, 11];

(* Question 4 *)
fun quicksort _ nil = nil
  | quicksort _ [a] = [a]
  | quicksort f [a,b] = if f(a,b) then [a,b] else [b,a]
  | quicksort f lst = 
  let
    fun get(a::_, 1) = a
      | get(_::b, n) = get(b, n-1)
    val len = length lst
    val first = get(lst, 1)
    val middle = get(lst, (len+1) div 2)
    val last = get(lst, len)
    val pivot = (first + middle + last) div 3
    fun split nil = (nil, nil, nil)
      | split (a::b) = 
      let
        val (lower, middle, upper) = split b
      in
        if pivot = a then 
          (lower, a::middle, upper) 
        else 
          if f(pivot, a) then 
            (lower, middle, a::upper) 
          else 
            (a::lower, middle, upper) 
      end
    val (lower, middle, upper) = split lst
  in
       (quicksort f lower) @ middle @ (quicksort f upper)
  end;

quicksort ((op >),[0, 5, 1, ~4, 9, 11]);