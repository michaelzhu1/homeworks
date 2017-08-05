require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    take_turn
    until game_over
      sleep 0.5
      system("clear")
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |s|
      puts s
      sleep 1
      system("clear")
      sleep 0.5
    end
  end

  def require_sequence
    puts "Please type out the color and separate them by commas without any spaces"
    guess = gets.chomp.split(",")
    @game_over = true unless guess == @seq
    sleep 0.5
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You just finished #{sequence_length} rounds, good job!"
  end

  def game_over_message
    puts "Sorry, game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
