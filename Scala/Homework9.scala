object Homework9 {

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

  def selection_sort(lst: List[Int]): List[Int] = {
    0
  }


//
//  def insertion_sort(lst: List[Int]): List[Int] = {
//
//  }


  def main(args: Array[String]) {
    val lst = List(5,4,11,2,3,1,0,9)
    println(merge_sort(lst))
    println(selection_sort(lst))
//    println(insertion_sort(lst))
  }
}