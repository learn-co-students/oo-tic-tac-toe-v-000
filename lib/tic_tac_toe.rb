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
  [2,4,6]
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] ==  "O"
  end

  def valid_move?(index)
    if @board[index] == "X" || @board[index] == "O" || @board[index] == nil
      return false
    elsif index < 0 || index >= 9 || index == nil
      return false
    elsif @board[index] == " " || @board[index] == ""
      return true
    end
  end

  def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

  def current_player
    value = turn_count
    value % 2 == 0 ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.each { |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    end
}
    return false
  end

  def full?
    if @board.any? { |token| token == "" || token == " " }
      return false
    else
      return true
    end
  end

  def draw?
    !won?  && full?
  end

  def over?
  won? || full? || draw?
  end

  def winner
    if !won?
      return nil
    elsif  
      winning_combo = won?
      @board[winning_combo.first] 
    end 
  end

  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  
end