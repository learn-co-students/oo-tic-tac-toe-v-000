require 'pry'

class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token="X")
    @board[index]=token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
        counter += 1
      end 
    end
    counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else 
      return "O"
    end
  end
    
  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    else 
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == 'X' && @board[win_combo[1]] == 'X' && @board[win_combo[2]] == 'X') || (@board[win_combo[0]] == 'O' && @board[win_combo[1]] == 'O' && @board[win_combo[2]] == 'O')
          return win_combo
      end
    end
    nil
  end
  
  def full?
    @board.all? do |token|
      token != " "
    end
  end
  
  def draw?
    full? && !won?
  end  
  
  def over?
    won? || draw?
  end
  
  def winner
    win_combo = won?
    if !won?
      nil
    elsif @board[win_combo[0]] == "X"
      return "X"
    else @board[win_combo[0]] == "O"
      return "O"
    end
  end
  
  def play
    
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else !won?
      puts "Cat's Game!"
    end
  end

end 