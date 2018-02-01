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
  [6,4,2]
 ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(number)
     number.to_i - 1
   end

   def move (index, current_player)
     @board[index] = current_player
   end

   def position_taken?(index)
    @board[index] != " " && @board[index] != ""
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
   WIN_COMBINATIONS.detect do |combo|
      element_1 = combo[0]
      element_2 = combo[1]
      element_3 = combo[2]
      index_1 = @board[element_1]
      index_2 = @board[element_2]
      index_3 = @board[element_3]
      index_1 == index_2 && index_2 == index_3 && position_taken?(element_1)
    end
  end

  def full?
   @board.all? do |index|
     index == "X" || index == "O"
    end
   end

   def draw?
    full? && !won?
   end

   def over?
   full? || won? || draw?
   end

   def winner
      if winning = won?
      @board[winning[0]]
    end
   end

   def play
 until over?
   turn
 end

  if won?
    winner
    puts "Congratulations #{winner}!"
  else draw?
   puts "Cat's Game!"
  draw?
  end
 end

end
