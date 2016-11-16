# require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token)
    @board[index.to_i - 1] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i - 1)
  end

  # def input_to_index(input)
  #   input.to_i - 1
  # end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      puts "Incorrect entry. Try again."
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[1]] == @board[i[2]] &&
      position_taken?(i[0])
    end
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      return @board[won?.last]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

# rspec spec/01_tic_tac_toe_spec.rb
# rspec spec/02_play_spec.rb

# bundle install
# rake console initiates pry(main)
# rspec spec/01_tic_tac_toe_spec.rb
# rspec spec/02_play_spec.rb
# rspec spec/03_cli_spec.rb

# learn, learn open, learn save and learn submit
# pwd, ls, cd .., cd <filename>, rm -rf
# from the labs/ directory, type cd ti<tab> autocompletes after partial input
# ls to see the list of files
# cd labs
# 'Learn.co' --> 'Reconnect'
