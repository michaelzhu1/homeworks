class Game
  def initialize()
    @board = Board.new
  end

  def play
  end

  def play_turn
  end
  
end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
