require 'pry'
class TicTacToe
  def initialize
  @board = Array.new(9, " ")
  end
  
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
  [6,4,2],
  [0,4,8]]

  def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end

  def move(converted_input, player="X")
    board[converted_input] = player
  end

  def position_taken?(index)
    if board[index] == "X" || board[index] ==  "O"
      true
    else
      false
      end
    end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end
  
  def turn_count
    counter = 0
    board.count do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
end

  def current_player
    if turn_count % 2 == 0
      "X"
    else "O"
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
      puts "invalid"
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
    board.all? {|square| square == "X" || square == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      player = won?
      index = player.first
      board[index]
    else
      nil
    end
  end
  
  def play
    while !over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    elsif  draw?
      puts "Cat's Game!"
    end
  end
end




 