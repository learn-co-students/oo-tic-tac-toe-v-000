class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
    turn_count
    display_board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
    else
      return false
    end
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn_count
   @board.count{|token| token == "X" || token == "O"}
 end

 def turn
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   token = current_player
   puts index
   if valid_move?(index)
     puts move(index, token) && display_board
   else
     puts "Your choice is invalid, please try again."
     turn
   end
 end

 def won?
   WIN_COMBINATIONS.detect do |w|
     @board[w[0]] ==  @board[w[1]] && @board[w[2]] == @board[w[0]] && position_taken?(w[0])
   end
 end

 def full?
   @board.all? do |b|
     b == "X" || b == "O"
   end
 end

 def draw?
   if full? && !won?
     return true
   else
     return false
     end
 end

 def over?
   @board.all? do |b|
     b == "X" || b == "O" && !won? || won?
   end
 end

 def winner
   if winning_combo = won?
     @board[winning_combo[0]]
   end
 end

 def play
     until over? == true || draw? != false
         turn
     end
     if winner
       puts "Congratulations #{winner}!"
     else draw?
       puts "Cat's Game!"
     end
   end

end
