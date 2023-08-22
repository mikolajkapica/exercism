import scala.annotation.tailrec

object MatchingBrackets {
  private val openBrackets = Set('(', '[', '{')
  private val closeBrackets = Set(')', ']', '}')

  def isPaired(brackets: String): Boolean = {
    @tailrec
    def aux(notClosedBrackets: List[Char], pos: Int): Boolean = {
      if (pos == (brackets.length)) {
        notClosedBrackets.isEmpty
      }
      else brackets(pos) match {
        case c if openBrackets.contains(c) =>
          aux(c :: notClosedBrackets, pos + 1)
        case c if closeBrackets.contains(c) =>
          if (notClosedBrackets.isEmpty) false
          else notClosedBrackets.head match {
            case '(' if c == ')' => aux(notClosedBrackets.tail, pos + 1)
            case '[' if c == ']' => aux(notClosedBrackets.tail, pos + 1)
            case '{' if c == '}' => aux(notClosedBrackets.tail, pos + 1)
            case _ => false
          }
        case _ =>
          aux(notClosedBrackets, pos + 1)
      }
    }
    aux(List(), 0)
  }
}
