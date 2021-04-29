class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # 1st Column
    [1,4,7], # 2nd Column
    [2,5,8], # 3rd Column
    [0,4,8], # Diagonal 1
    [2,4,6]  # Diagonal 2
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |token|
      if token == "X" || token == "O"
      count += 1
    end
    end
    return count
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

 def turn
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(index)
     move(index, token = current_player)
     display_board
   else
     turn
   end
 end

 def won?
   WIN_COMBINATIONS.select do |win_array|
     if @board[win_array[0]] == @board[win_array[1]] && @board[win_array[0]] == @board[win_array[2]] && position_taken?(win_array[0])
         return win_array
     end
   end
   return false
 end

 def full?
   [1,2,3,4,5,6,7,8].all? do |index|
     position_taken?(index)
   end
 end

 def draw?
   if !won? && full?
     return true
   else
     return false
   end
 end

 def over?
   if draw? || full? || won?
     true
   end
 end

 def winner
   if won?
     @board[won?[0]]
   end
 end

 def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
