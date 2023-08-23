import java.util
import scala.annotation.tailrec

object SpiralMatrix {
  private type Matrix = List[List[Int]]

  val directions = List(Up, Down, Left, Right)

  val directionsToCoordinates = new util.HashMap[Direction, (Int, Int)] {
    put(Up, (0, -1))
    put(Down, (0, 1))
    put(Left, (-1, 0))
    put(Right, (1, 0))
  }



  private def put(myMatrix: Matrix, n: Int, x: Int, y: Int): Matrix = {
    myMatrix.updated(y-1, myMatrix(y-1).updated(x-1, n))
  }

  def printMatrix(myMatrix: Matrix): Unit = {
    myMatrix.foreach { row =>
      row.foreach { elem =>
        // print formatted so every number takes 2 spaces
        print(f"$elem%2d ")
      }
      println()
    }
  }

  def spiralMatrix(size: Int): Matrix = {
    if (size == 0) return List()

    @tailrec
    def aux(matrix: Matrix,
            n: Int, x: Int, y: Int,
            direction: Direction,
            cooldown: Int, cooldownLeft: Int,
            firstTime: Boolean): Matrix = {
      if (n > size * size) matrix
      else {
        val newMatrix = put(matrix, n, x, y)
        val (addX, addY) = directionsToCoordinates.get(direction)
        if (cooldownLeft > 1) aux(newMatrix, n + 1, x + addX, y + addY, direction, cooldown, cooldownLeft - 1, firstTime)
        else {
          val newDirection = direction match {
            case Down => Left
            case Left => Up
            case Up => Right
            case Right => Down
          }
          val (addX, addY) = directionsToCoordinates.get(newDirection)
          if (!firstTime) aux(newMatrix, n + 1, x + addX, y + addY, newDirection, cooldown-1, cooldown-1, firstTime = true)
          else aux(newMatrix, n + 1, x + addX, y + addY, newDirection, cooldown, cooldown, firstTime = false)
        }
      }
    }
    // create a matrix with first row already filled
    val zeros: Matrix = List.fill(size, size)(0)
    val firstRow = (1 to size).toList
    val initialMatrix = zeros.updated(0, firstRow)
    aux(initialMatrix, size+1, size, 2, Down, size - 1, size - 1, firstTime = true)
  }
}

sealed trait Direction
case object Up extends Direction
case object Down extends Direction
case object Left extends Direction
case object Right extends Direction



