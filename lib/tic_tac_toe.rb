require "pry"

class TicTacToe
  def initialize(board=nil)
    @board=board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index, current_player="X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index]==" ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
  counter = 0
  @board.each do |number|
      if number != " "
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count % 2 != 1
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def full?
    @board.all? do |taken|
      taken == "X" || taken =="O"
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board[combo[0]] == @board[combo[1]]) && 
      (@board[combo[0]] == @board[combo[2]]) &&
      position_taken?(combo[0])
    end
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
  if won?
    first_winning_position = won?[0]
    @board[first_winning_position]
  else
    nil
  end
  end 
  
  def play
  until over?
    turn
  end
  if draw?
    puts "Cat's Game!"
  end
  if won?
    puts "Congratulations #{winner}!"
  end
end
end