require_relative "piece"
require_relative "cursor"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
    @grid = fill_board
  end

  def fill_board
    self[[0,0]] = Rook.new
    self[[0,1]] = Knight.new
    self[[0,2]] = Bishop.new
    self[[0,3]] = Queen.new
    self[[0,4]] = King.new
    self[[0,5]] = Bishop.new
    self[[0,6]] = Knight.new
    self[[0,7]] = Rook.new
    self[[7,0]] = Rook.new
    self[[7,1]] = Knight.new
    self[[7,2]] = Bishop.new
    self[[7,3]] = King.new
    self[[7,4]] = Queen.new
    self[[7,5]] = Bishop.new
    self[[7,6]] = Knight.new
    self[[7,7]] = Rook.new
    (0...8).each do |i|
      self[[1, i]] = Pawn.new
      self[[6, i]] = Pawn.new
    end
    self
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError if @grid[start_pos[0]][start_pos[1]].is_a?(NullPiece)
    @grid[end_pos[0]][end_pos[1]] = @grid[start_pos[0]][start_pos[1]]
    @grid[end_pos[0]][end_pos[1]]= NullPiece.new

  end

  def in_bounds(position)
    if position[0] > 7
      position[0] = 7
    end

    if position[1] > 7
      position[1] = 7
    end

    if position[0] < 0
      position[0] = 0
    end

    if position[1] < 0
      position[1] = 0
    end
    position
  end

end
