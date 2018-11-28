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

  /**
    * derive this du/dx expression u against the input string x and return the derivative .
    * Note that the second parameter of the method deriv is the string of some variable name.
    *
    * @param dx
    * @return The derivative expression
    */
  def deriv(dx: String): Exp ={
    this match{
      case Const(_) => Const(0)
      case Var (variable) => if (variable.equals(dx)) Const(1) else Const(0)
      case Plus (exp1, exp2) => Plus(exp1.deriv(dx), exp2.deriv(dx))
      case Times (exp1, exp2) => Plus(Times(exp1.deriv(dx), exp2), Times(exp1, exp2.deriv(dx)))
      case Pow (exp1, int) => Times(Times(Const(int), Pow(exp1, int-1)), exp1.deriv(dx))
    }
  }

  /**
    * Helper method for the simplify method. Finds common expressions that can easily be simplified
    * @return The simplification of an expression if possible or the original expression
    */
  protected def attemptRootSimplification: Exp ={
    this match {
      case Times(Const(1), x) => x
      case Times(x, Const(1)) => x
      case Times(Const(0), _) => Const(0)
      case Times(_, Const(0)) => Const(0)
      case Plus(Const(0), x) => x
      case Plus(x, Const(0)) => x
      case Pow(x, 1) => x
      case Pow(_, 0) => Const(1)
      case _ => this
    }
  }

  /**
    * Recursive method to simplify functions
    * @return the simplified result of the original expression
    */
  def simplify: Exp ={
    this match{
      case Const(x) => Const(x)
      case Var(x) => Var(x)
      case Times(exp1, exp2) => Times(exp1.simplify, exp2.simplify).attemptRootSimplification
      case Plus(exp1, exp2) => Plus(exp1.simplify, exp2.simplify).attemptRootSimplification
      case Pow(exp, int) => Pow(exp.simplify,int).attemptRootSimplification
    }
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
    println(e.deriv("x"))
    println(e1.deriv("x"))
    println(e.deriv("x").simplify)
    println(e1.deriv("x").simplify)
    val e2 = Pow (Plus (Var("x"), Const(0)), 2)
    println(e2)
    println(e2.simplify)
  }
}