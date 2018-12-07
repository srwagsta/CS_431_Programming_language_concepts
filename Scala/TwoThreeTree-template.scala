package hwk12
 

trait Tree[X <: Ordered[X]] {
  def contains(e: X): Boolean 
  def insert(e: X): Tree[X] = ins(e) match {
    case FourNode(t1, a, t2, b, t3, c, t4) => TwoNode(TwoNode(t1, a, t2), b, TwoNode(t3, c, t4))
    case n => n 
  }
  def ins(e: X): Tree[X] 
  def height: Int
}

case class Leaf[X <: Ordered[X]]() extends Tree[X] {
  def contains(e: X): Boolean = false

  def ins(e: X): Tree[X] = new TwoNode[X](Leaf(), e, Leaf())

  def height: Int = 0

  override def toString :String = "L"

}

case class TwoNode[X <: Ordered[X]](left: Tree[X], x:X, right: Tree[X]) extends Tree[X] {
  def contains(e: X): Boolean =
    if (e < x ) left.contains(e)
    else if (e > x) right.contains(e)
    else true


  def ins(e: X): Tree[X] =
    this match {
      case TwoNode(Leaf(), _, Leaf()) =>
        if (e < x) ThreeNode(left, e, Leaf(), x, right)
        else ThreeNode(left, x, Leaf(), e, right)
      case _ =>
        if (e < x)
          left.ins(e) match {
            case FourNode(leftTree, data1, middle1, data2, middle2, data3, rightTree) => ThreeNode(TwoNode(leftTree, data1, middle1), data2, TwoNode(middle2, data3, rightTree), x, right)
            case newLeft => TwoNode(newLeft, x, right)
          }
        right.ins(e) match {
          case FourNode(leftTree, data1, middle1, data2, middle2, data3, rightTree) => ThreeNode(left, x, TwoNode(leftTree, data1, middle1), data2, TwoNode(middle2, data3, rightTree))
          case newRight => TwoNode(left, x, newRight)
        }
    }


  def height: Int = 1 + left.height

  override def toString :String = s"($left, $x, $right)"
}

case class ThreeNode[X <: Ordered[X]](left: Tree[X], x1:X, middle:Tree[X], x2:X, right: Tree[X]) extends Tree[X] {
  def contains(e: X): Boolean =
    if (e < x1) left.contains(e)
    else if (e > x1){
      if (e < x2) middle.contains(e)
      else if (e > x2) right.contains(e)
      else true
    }
    else true

  def ins(e: X): Tree[X] =
    this match {
      case ThreeNode(Leaf(), _, Leaf(), _, Leaf()) =>
        if (e < x1) FourNode (Leaf(), e, left, x1, middle, x2, right)
        else if (x2 < e) FourNode (Leaf(), x1, left, x2, middle, e, right)
        else FourNode (Leaf(), x1, left, e, middle, x2, right)

      case _ =>
        if (e < x1) left.ins(e) match {
          case FourNode(leftTree, data1, middle1, data2, middle2, data3, rightTree) =>
            FourNode(TwoNode(leftTree, data1, middle1), data2, TwoNode(middle2, data3, rightTree), x1, middle, x2, right)
          case newLeft => ThreeNode(newLeft, x1, middle, x2, right)
        }
        else if (x2 < e) right.ins(e) match {
          case FourNode(leftTree, data1, middle1, data2, middle2, data3, rightTree) =>
            FourNode(left, x1, middle, x2, TwoNode(leftTree, data1, middle1), data2, TwoNode(middle2, data3, rightTree))
          case newRight => ThreeNode(left, x1, middle, x2, newRight)
        }
        else middle.ins(e) match {
          case FourNode(leftTree, data1, middle1, data2, middle2, data3, rightTree) =>
            FourNode(left, x1, TwoNode(leftTree, data1, middle1), data2, TwoNode(middle2, data3, rightTree), x2, right)
          case newMiddle => ThreeNode(left, x1, newMiddle, x2, right)
        }
    }


  def height: Int = 1 + left.height

  override def toString :String = s"($left, $x1, $middle, $x2, $right)"
}

case class FourNode[X<:Ordered[X]](t1:Tree[X], a:X, t2:Tree[X], b:X, t3:Tree[X], c:X, t4:Tree[X]) extends Tree[X] {
  def contains(e: X): Boolean = throw new Exception()
  def ins(e: X): Tree[X] = throw new Exception()
  def height: Int = throw new Exception()
  override def toString :String = throw new Exception()
}
 
case class OrderedInt(i: Int) extends Ordered[OrderedInt] {
  def compare(that: OrderedInt) = i - that.i
  override def toString :String = i.toString
}
case class OrderedChar(c: Char) extends Ordered[OrderedChar] {
  def compare(that: OrderedChar) = c - that.c
  override def toString :String = c.toString
}


// Test Driver

object TwoThreeTree {
    def main(arg: Array[String]) {
	  val input = List(3, 4, 2, 10, 9, 1, 5, 6, 11, 12, 13, 14, 15).map(i=>OrderedInt(i))
	  
	  val t = input.foldLeft[Tree[OrderedInt]](Leaf())((l, i) => { val x = l.insert(i); println(x.height + " " + x); x }) 
	  
	  println(t.contains(OrderedInt(5)))
	  println(t.contains(OrderedInt(14)))
	  println(t.contains(OrderedInt(7))) 
	  println(t.contains(OrderedInt(17))) 
	  
	  val input2 = List('a', 'c', 'd', 'g', 'e', 'z', 'r', 'k', 'l', 'p', 'y').map(i => OrderedChar(i))
	  
	  val t2 = input2.foldLeft[Tree[OrderedChar]](Leaf())((l, i) => { val x = l.insert(i); println(x.height + " " + x); x }) 
	  println(t2.contains(OrderedChar('d')))
	  println(t2.contains(OrderedChar('z')))
	  println(t2.contains(OrderedChar('m'))) 
	  println(t2.contains(OrderedChar('s'))) 
  }
}
