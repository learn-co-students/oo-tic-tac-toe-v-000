class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
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
    @board.count{|value| value == "X" || value == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combinations|
      index1 = win_combinations[0]
      index2 = win_combinations[1]
      index3 = win_combinations[2]
      
      board_spot1 = @board[index1]
      board_spot2 = @board[index2]
      board_spot3 = @board[index3]
      
      if board_spot1 == "X" && board_spot2 == "X" && board_spot3 == "X"
        return win_combinations
      elsif board_spot1 == "O" && board_spot2 == "O" && board_spot3 == "O"
        return win_combinations
      else
        false
      end
    end
    return false
  end
  
  def full?
    @board.none? do |value|
      value == " "
    end
  end
  
  def draw?
    if won? || !full?
      return false
    else
      return true
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end
  
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
end