object Twofer {
  def twofer(name: String): String =
    s"One for $name, one for me."

  def twofer(): String =
    twofer("you")
}
