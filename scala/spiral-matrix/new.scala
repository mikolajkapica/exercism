object spiralmatrix {
  def spiralMatrix(rank: Int): List[List[Int]] = {
    def constructMatrix(rows: Int, columns: Int, from: Int): List[List[Int]] =
      if (rows == 0) List.empty
      else (from until from + columns).toList :: constructMatrix(columns, rows - 1, from + columns).reverse.transpose










										 constructMatrix(rank, rank, 1)





	}





}




