object Homework10
{

  /**
    * Scala implementation of recursive merge sort using pattern matching
    * @param An unsorted initial list of Ints
    * @return A sorted list of the initial Int values in increasing order
    */
  def merge_sort(f: (Int, Int) => Boolean) (initialList: List[Int]): List[Int] = {
    def split: (List[Int], List[Int]) = {
      val cut = initialList.length/2
      ( initialList take cut , initialList drop cut )
    }
    def merge(leftList: List[Int], rightList: List[Int]): List[Int] = {
      (leftList, rightList) match {
        case (Nil, _) => rightList
        case (_, Nil) => leftList
        case (leftElement::leftRemaining, rightElement::rightRemaining) =>
          if (f(leftElement,rightElement)) leftElement::merge(leftRemaining, rightList)
          else rightElement::merge(leftList, rightRemaining)
      }
    }
    initialList match{
      case Nil => Nil
      case x::Nil => List(x)
      case _ =>
        val (left, right) = split
        merge (merge_sort (f) (left), merge_sort (f) (right))
    }
  }

  /**
    * Scala implementation of recursive selection sort using pattern matching
    * @param An unsorted initial list of Ints
    * @return A sorted list of the initial Int values in increasing order
    */
  def selection_sort(f: (Int, Int) => Boolean) (initialList: List[Int]): List[Int] = {
    def select(selectList: List[Int]): List[Int] = {
      selectList match {
        case Nil => Nil
        case lastElement::Nil => List(lastElement)
        case firstElement::list =>
          val testElement::remaining = select(list)
          if(f(testElement, firstElement)) select(testElement::firstElement::remaining)
          else firstElement::testElement::remaining
      }
    }
    initialList match {
      case Nil => Nil
      case _ => select(initialList)
    }
  }

  /**
    * Scala implementation of recursive insertion sort using pattern matching
    * @param An unsorted initial list of Ints
    * @return A sorted list of the initial Int values in increasing order
    */
  def insertion_sort(f: (Int, Int) => Boolean) (initialList: List[Int]): List[Int] = {
    def insert(element: Int, list: List[Int]): List[Int] ={
      (element, list) match {
        case (_, Nil) => List(element)
        case (_, head::rest) =>
          if(f(element, head)) element::head::rest
          else head::insert(element, rest)
      }
    }
    def sort(sofar: List[Int], list: List[Int]): List[Int] = {
      list match {
        case Nil => sofar
        case element::rest => insert(element, sort(sofar,rest))
      }
    }
    initialList match {
      case Nil => Nil
      case _ => sort(Nil, initialList)
    }
  }

  /**
    * Add two integer vectors of the same size.
    * @param vector1
    * @param vector2
    * @return A vector result of the addition operation
    */
  def vectorAdd(vector1: List[Int], vector2: List[Int]): List[Int] = {
    (vector1, vector2) match {
      case(Nil, Nil) => Nil
      case(Nil, _) => vector2
      case(_, Nil) => vector1
      case(_, _) => vector1.zip(vector2).map({case(int1, int2)=> int1+int2})
    }
  }

  /**
    * multiple an integer with an integer list
    * @param multInt
    * @param intList
    * @return new List[Int] with each element matching the initial List elements multiplied by the Int value
    */
  def svProduct(multInt: Int, intList:List[Int]): List[Int]= {
    (multInt, intList) match{
      case(_, Nil) => Nil
      case(_, _) => intList.map((y: Int) => multInt*y)
    }
  }

  /**
    * Multiplies a row vector of size n with a matrix with n rows and m columns to produce
    * a vector of size m
    *
    * @param vector
    * @param matrix
    * @return the resulting vector represented as a list
    */
  def vmProduct(vector: List[Int], matrix: List[List[Int]]): List[Int] ={
    vector.zip(matrix)
      .map({case(int:Int, list:List[Int])=>svProduct(int,list)})
      .reduce(vectorAdd)
  }

  /**
    * multiple a m×n matrix with a n×k matrix to obtain a m×k matrix
    * @param matrix1
    * @param matrix2
    * @return the resulting product matrix of type List[Int]
    */
  def matrixProduct(matrix1: List[List[Int]], matrix2: List[List[Int]]): List[List[Int]] = {
    matrix1.map({row: List[Int] => vmProduct(row, matrix2)})
  }

  def main(args: Array[String]) {
    val lst = List(5,4,11,2,3,1,0,9)
    println(merge_sort(_>_)(lst))
    println(selection_sort(_>_)(lst))
    println(insertion_sort(_>_)(lst))
    println(merge_sort(_<_)(lst))
    println(selection_sort(_<_)(lst))
    println(insertion_sort(_<_)(lst))
    val v1 = List(1,2,3)
    val v2 = List(4,5,6)
    println(vectorAdd(v1, v2))
    println(svProduct(2, v1))
    val m1 = List(List(1,1), List(2,1), List(3,1))
    println(vmProduct(v1, m1))
    val m2 = List(List(1,2,3), List(1,1,1))
    println(matrixProduct(m2, m1))
  }
}