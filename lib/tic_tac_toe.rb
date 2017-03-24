class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  #bottom row
    [0,3,6],  #left column
    [1,4,7],  #middle column
    [2,5,8],  #right column
    [0,4,8],  #right diagonal
    [2,4,6]  #left diagonal
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
    @board[index] = token
    # index = token
  end

  def position_taken?(index)
    if
      @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end


  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index) == true
       move(index, current_player)
     else
       puts "Please enter 1-9:"
       user_input = gets.strip
       index = input_to_index(user_input)
    end
     display_board
   end

   def turn_count
   counter = 0
     @board.each do |space|
     if space == "X" || space == "O"
      counter +=1
     end
     end

     return counter
   end

   def current_player
     turn_count % 2 == 0? "X" : "O"
   end


   def full?
     @board.all? { |position| position == "X" || position == "O" }
   end

   def draw?
     if !won? && full?
       return true
     end
   end

   def over?
     # conditions automatically return true or false
     if draw? || won?
       true
     end
   end


   def winner
     if won?
       @board[won?[0]]
     end
   end

   def won?
   WIN_COMBINATIONS.any? do |win_combination|
     if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
       return win_combination
     elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
       return win_combination
     end
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
