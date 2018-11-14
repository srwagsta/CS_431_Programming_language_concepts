Homework 9: Sorting Algorithms in Scala 
=======================================

*Stephen Wagstaff* \
*CS 431* \
*November 12, 2018*

---

1. Write a function `merge_sort(lst: List[Int]): List[Int]` that takes
a list, and return a sorted list in **increasing order**.

    ```scala
      def merge_sort(initialList: List[Int]): List[Int] = {
    
        def split: (List[Int], List[Int]) = {
          val cut = initialList.length/2
          ( initialList take cut , initialList drop cut )
        }
    
        def merge(leftList: List[Int], rightList: List[Int]): List[Int] = {
          (leftList, rightList) match {
            case (Nil, _) => rightList
            case (_, Nil) => leftList
            case ((leftElement::leftRemaining), (rightElement::rightRemaining)) =>
              if (leftElement > rightElement) leftElement::merge(leftRemaining, rightList)
              else rightElement::merge(leftList, rightRemaining)
          }
        }
    
        initialList match{
          case Nil => Nil
          case x::Nil => x::Nil
          case _ =>
            val (left, right) = split
            merge (merge_sort(left), merge_sort(right))
        }
      }
    ```

2. Write a function `selection_sort(lst: List[Int]): List[Int]` that
takes a list and return a sorted list in **increasing order**.

    ```scala
    def selection_sort(lst: List[Int]): List[Int] =
    ```

3. Write a function `insertion_sort(lst: List[Int]): List[Int]` that
takes a list and return a sorted list in **increasing order**.

    ```scala
    def insertion_sort(lst: List[Int]): List[Int] =
    ```