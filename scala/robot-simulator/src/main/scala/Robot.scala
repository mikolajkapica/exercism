sealed trait Bearing
object Bearing {
  case object North extends Bearing
  case object East extends Bearing
  case object South extends Bearing
  case object West extends Bearing
}

case class Robot(val bearing: Bearing, val coordinates: (Int, Int)) {
  def turnRight(): Robot = bearing match {
    case Bearing.North => new Robot(Bearing.East, coordinates)
    case Bearing.East => new Robot(Bearing.South, coordinates)
    case Bearing.South => new Robot(Bearing.West, coordinates)
    case Bearing.West => new Robot(Bearing.North, coordinates)
  }

  def turnLeft(): Robot = bearing match {
    case Bearing.North => new Robot(Bearing.West, coordinates)
    case Bearing.East => new Robot(Bearing.North, coordinates)
    case Bearing.South => new Robot(Bearing.East, coordinates)
    case Bearing.West => new Robot(Bearing.South, coordinates)
  }

  def advance(): Robot = bearing match {
    case Bearing.North => new Robot(bearing, (coordinates._1, coordinates._2 + 1))
    case Bearing.East => new Robot(bearing, (coordinates._1 + 1, coordinates._2))
    case Bearing.South => new Robot(bearing, (coordinates._1, coordinates._2 - 1))
    case Bearing.West => new Robot(bearing, (coordinates._1 - 1, coordinates._2))
  }

  def simulate(instructions: String): Robot =
    instructions.foldLeft(this) { (robot, instruction) =>
      instruction match {
        case 'R' => robot.turnRight()
        case 'L' => robot.turnLeft()
        case 'A' => robot.advance()
      }
    }
}
