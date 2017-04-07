class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
  #setter
    def board=(board)
      @board = board
    end
  #getter
    def board
      @board
    end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]       ]
  def display_board
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  def input_to_index(input)
    input.to_i - 1
  end
  def move(index, current_player="X")
    board[index] = current_player
  end
  def position_taken?(index)
    board[index] != " " && board[index] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    board.count("X") + board.count("O")
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
  #  turn_count(board)
  #  current_player(board)
    if valid_move?(index)
      move(index, player)
      display_board
    else
      puts "That is not a valid move."
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  def full?
     board.all? { |pos| pos != " "}
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end
  def winner
    if !won?
      nil
    else
      board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
  
end

#   learn spec/03_play_spec.rb
