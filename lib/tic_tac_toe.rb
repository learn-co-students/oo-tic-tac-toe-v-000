require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   WIN_COMBINATIONS = [[0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]]

   def input_to_index(input)
     input = (input.to_i-1)
   end

   def move(input_to_index, value = "X")
     @board[input_to_index] = value
   end

   def position_taken?( index_number)
     if @board[index_number] == " "|| @board[index_number] == "" || @board[index_number] == nil
       false
     elsif @board[index_number]== "X" || "O"
       true
     end

   end
   def valid_move?(index)
       if index.between?(0,8) && position_taken?(index) == false
         true
       else
       end
   end

   def turn_count
     counter = 0
    @board.each do |char|
     if char == "X" || char == "O"
      counter += 1
    end
    end
    counter
   end

   def current_player
     if turn_count % 2 == 0
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
       move(index, current_player)
       display_board
     else
       turn
     end
   end
   def won?

     WIN_COMBINATIONS.each do |win|

      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X"  && position_2 == "X" && position_3 == "X"
        return win
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win
      end
    end
    false
    end

    def full?
      @board.all? do |space|
        space == "X" || space == "O"
       end
    end

   def draw?
     if won? == false  && full? == true
       true
   end
   end

   def over?
     won? || draw? || full?
   end

   def winner
     if combo = won?
      @board[combo[0]]
     end
      # if won?
      #   index = won?
      #   return @board[index[0]]
       #return @board[won?[0]]
    #  else
    #    return nil
      # end
   end

   def play
    turn until over?
    if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
end

end
