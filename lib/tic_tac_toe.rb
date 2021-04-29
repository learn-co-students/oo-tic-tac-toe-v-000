class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle
    [6,7,8], #bottom
    [0,3,6], #left
    [1,4,7], # middle
    [2,5,8], #right
    [0,4,8], #diagonal
    [2,4,6]  #diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
  input = input.to_i
  input -1
  end

  def move(index, current_player = "X")
  @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
     if index.between?(1,9) && !position_taken?(index)
     end
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

   def current_player
     turn_count.even? ? "X" : "O"
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
    WIN_COMBINATIONS.detect do |win|
       @board[win[0]] == @board[win[1]] && @board[win[2]] == @board[win[0]] && position_taken?(win[0])
    end
   end

   def full?
     @board.none? { |i|  i == " "}
   end

   def draw?
      full? && !won?
   end

   def over?
     won? || full?
   end

   def winner
     if  win = won?
       @board[win.first]
     end
   end

   def play
     until over? || draw? do
       turn
     end
         if draw?
           puts "Cat's Game!"
         elsif winner == "X"
           puts "Congratulations X!"
         elsif winner == "O"
           puts "Congratulations O!"
       end
   end

end
