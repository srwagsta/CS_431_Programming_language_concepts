abstract class Exp{

  /**
    * Override of the implicit toString implementation
    * @return String representation of Expressions
    */
  override def toString: String ={
    this match{
      case Const(value) => value.toString
      case Var(value) => value
      case Plus(value1, value2) => "(" + value1 + " + " + value2 + ")"
      case Times(value1, value2) => "(" + value1 + " * " + value2 + ")"
      case Pow(base, power) => "(" + base + "^" + power + ")"
    }
  }


  def deriv(dx: String): Exp ={

  }
}

case class Const(value: Int) extends Exp
case class Var(value: String) extends Exp
case class Plus(value1: Exp, value2: Exp) extends Exp
case class Times(value1: Exp, value2: Exp) extends Exp
case class Pow(base: Exp, power: Int) extends Exp


object Homework11
{


  def main(args: Array[String]) {
    val e = Times (Times (Var("x"), Var("y")), Plus (Var("x"), Const(3)))
    val e1 = Pow (Var("x"), 4)
    println(e)
    println(e1)
//    println(e.deriv("x"))
//    println(e1.deriv("x"))
//    println(e.deriv("x").simplify)
//    println(e1.deriv("x").simplify)
//    val e2 = Pow (Plus (Var("x"), Const(0)), 2)
//    println(e2)
//    println(e2.simplify)
  }
}