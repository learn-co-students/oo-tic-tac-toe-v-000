class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # First column
    [1,4,7],  # Second column
    [2,5,8],  # Third column
    [0,4,8],  # First diagonal
    [2,4,6]   # Second diagonal
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

  def move(index, token) 
    @board[index] = token  
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    else true 
  end
end 

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|

      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      end
    end
  end

  def full?
    @board.each do |index|
      if index == " "
        return false
      else true
      end
    end
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? || draw? == true
      return true
  end
  end

  def winner
  WIN_COMBINATIONS.each do |win_combination|
    if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X")
      return "X"
    elsif (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
      return "O"
    end

    if !won?
      return nil
    end
  end
  end

  def play
    turn until over?
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else draw?
      puts "Cat's Game!"
    end
  end

end 