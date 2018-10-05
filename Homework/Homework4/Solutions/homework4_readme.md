Homework 4: ML Pattern Matching
===============================

*Stephen Wagstaff* \
*CS 431* \
*October 4, 2018*

---

1. Write a function `zip` that takes two lists and return a list of 2-tuples.
    - For example, `zip ([1, 2, 3], [4, 5])` should return `[(1,4), (2,5)]`. Note that if one list is longer than the other, the unmatched portion of the longer list is ignored.

    ```sml
    fun zip (nil, _) = nil
      | zip (_, nil) = nil
      | zip (list1, list2) = 
    ```

2. Write a function `unzip` that takes a list of 2-tuples and return a tuple of two lists.
    -For example, `unzip [(1,2), (3,4), (5,6)]` should return `([1,3,5], [2,4,6])`

    ```sml
    fun unzip(nil) = nil
      | unzip(list) = 
    ```

3. Write a function `zip3` that takes three lists and return a list of 3-tuples.
    - For example, `zip3 ([1, 2, 3], [4, 5], [6,7,8])` should return `[(1,4,6), (2,5,7)]`. Note that if one list is longer than the others, the unmatched portion ofthe longer list is ignored.

    ```sml
    fun zip3 (nil, _, _) = nil
    ```

4. Write a function `unzip3` that takes a list of 3-tuples and return a tuple of three lists.
    - For example, `unzip3 [(1,2,3), (4,5,6), (7,8,9)]` should return `([1,4,7], [2,5,8], [3,6,9])`.

    ```sml
    fun unzip3 (nil) = nil
      | unzip3 (list) = 
    ```

5. Write a function `zipWithIndex` that takes a list and return a list of 2-tuples, where each tuple contains an index and a list element.
    - For example, `zipWithIndex ["a", "b", "c"]` should return `[(0, "a"), (1, "b"), (2, "c")]`.

    ```sml
    fun zipWithIndex (nil) = nil
      | zipWithIndex (list) = 
    ```

6. Write a function `flatten` that takes a list of lists and return a flat-tened list.
     - For example, `flatten [[1,2], [3], [4,5,6]]` should return `[1,2,3,4,5,6]`.

    ```sml
    fun flatten (nil) = nil
      | flatten (list) = 
    ```

7. Write a function `flatten2` that takes a list of 2-tuples and return a flat-tened list.
     - For example, `flatten2 [(1,2), (3,4), (5,6)]` should return `[1,2,3,4,5,6]`.

    ```sml
    fun flatten2 (nil) = nil
      | flatten2 (list) = 
    ```