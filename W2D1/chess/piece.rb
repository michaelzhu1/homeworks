class Piece
  attr_reader :symbol
  def initialize(symbol = nil, pos = nil)
    @symbol = "Q"
    @pos = pos
  end

  def change_pos(new_pos)
    @pos = new_pos
  end

  def moves
  end
end


class NullPiece < Piece
  def initialize
    @symbol = "*"
  end
end


class Rook < Piece
  def initialize
    @symbol = "R"
  end
end

class Bishop < Piece
  def initialize
    @symbol = "B"
  end
end

class Queen < Piece
  def initialize
    @symbol = "Q"
  end
end

class Knight < Piece
  def initialize
    @symbol = "K"
  end
end

class King < Piece
  def initialize
    @symbol = "$"
  end
end


module SlidingPiece
end


module SteppingPiece

end

class Pawn < Piece
end
