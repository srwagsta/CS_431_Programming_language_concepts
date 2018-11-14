object Homework9 {

  def merge_sort(lst: List[Int]): List[Int] = {
    def split (): (List[Int], List[Int]) = {
      val cut = lst.length/2

      // TODO: Slice the lists and return the results
      ( List.take (list,cut) , List.drop (list,cut) )


    }

    def merge(list1: List[Int], list2: List[Int]): List[Int] = {
      0
      // TODO: Implement this
    }



  }

  def selection_sort(lst: List[Int]): List[Int] = {
    0
  }

  def insertion_sort(lst: List[Int]): List[Int] = {

  }


  def main(args: Array[String]) {
    val lst = List(5,4,11,2,3,1,0,9)
    println(merge_sort(lst))
    println(selection_sort(lst))
    println(insertion_sort(lst))
  }
}