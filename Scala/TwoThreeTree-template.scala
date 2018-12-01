package hwk12
 

trait Tree[X <: Ordered[X]] {
  def contains(e: X): Boolean 
  def insert(e: X) = ins(e) match {
    case FourNode(t1, a, t2, b, t3, c, t4) => TwoNode(TwoNode(t1, a, t2), b, TwoNode(t3, c, t4))
    case n => n 
  }
  def ins(e: X): Tree[X] 
  def height: Int
}

case class Leaf[X <: Ordered[X]]() extends Tree[X] {
  // TODO
}

case class TwoNode[X <: Ordered[X]](left: Tree[X], x:X, right: Tree[X]) extends Tree[X] {
  // TODO
}

case class ThreeNode[X <: Ordered[X]](left: Tree[X], x1:X, middle:Tree[X], x2:X, right: Tree[X]) extends Tree[X] {
  // TODO
}

case class FourNode[X<:Ordered[X]](t1:Tree[X], a:X, t2:Tree[X], b:X, t3:Tree[X], c:X, t4:Tree[X]) extends Tree[X] {
  def contains(e: X): Boolean = throw new Exception()
  def ins(e: X): Tree[X] = throw new Exception()
  def height: Int = throw new Exception()
}
 
case class OrderedInt(i: Int) extends Ordered[OrderedInt] {
  def compare(that: OrderedInt) = i - that.i
  override def toString = i.toString
}
case class OrderedChar(c: Char) extends Ordered[OrderedChar] {
  def compare(that: OrderedChar) = c - that.c
  override def toString = c.toString
}

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
