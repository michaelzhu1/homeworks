require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    (0...8).each do |idx0|
      (0...8).each do |idx1|
        print @board[[idx0,idx1]].symbol
      end
      puts
    end
    @cursor.get_input
    system("clear")
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  display = Display.new(b)
  while true
    display.render
  end
end
