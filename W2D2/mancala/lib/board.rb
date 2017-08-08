class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    i = 0
    while i < @cups.length
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = [:stone,:stone,:stone,:stone ]
      end
      i += 1
    end
    @cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (1..14).include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    i = 0
    origin = start_pos
    while @cups[origin].length > 0
      if @cups[start_pos+i].nil?
        i = 0
        start_pos = 0
      end
      if current_player_name == @name1 && start_pos+i == 13
        i += 1
        next
      elsif current_player_name == @name2 && start_pos+i == 6
        i += 1
        next
      end
      @cups[start_pos+i] << @cups[origin].pop
      i += 1
    end
    render
    if next_turn(start_pos+i-1) == 1 && (start_pos+i-1 !=6 && start_pos+i-1 !=13)
      return :switch
    end
    if start_pos + i - 1 == 6 && current_player_name == @name1
      return :prompt
    elsif start_pos + i - 1 == 13 && current_player_name == @name2
      return :prompt
    end
    if @cups[start_pos + i - 1].length > 1
      return start_pos + i - 1
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    @cups[ending_cup_idx].length
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    all_cups = @cups[0..5] + @cups[7..13]
    return true if @cups[0..5].all?{|el| el.empty?} || @cups[7..13].all? {|el| el.empty?}
    false
  end

  def winner
    if @cups[13].length > @cups[6].length
      return @name2
    elsif @cups[13].length < @cups[6].length 
      return @name1
    else
      return :draw
    end
  end
end
