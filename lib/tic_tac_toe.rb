require 'pry'
class TicTacToe
  attr_accessor :board
  def initialize
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board

    # def initialize(board = nil)
    #   @board=board || Array.new(9, " ")
    #
    #   if board != nil
    #     @board = board
    #   else
    #     @board = Array.new(9, " ")
    #   end

  end
 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

 end
#
#  # def board
#  #   @board
#  # end
#  # def board=(board)
#  #   @board = board
#  # end
#
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def input_to_index(integer)
    integer.to_i-1
  end

#
  def move(position, char)
    @board[position] = char
  end


  def position_taken?(position)
    !(@board[position] == nil || @board[position] == " ")
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
    end

    def turn_count
      @board.count{|pos| pos != " "}
    end

    def current_player
      turn_count.even? ? "X" : "O"
    end

    def turn
      puts "Please enter 1-9:"
      integer = gets.strip
      position = input_to_index(integer)
      if valid_move?(position)
        char = current_player
        move(position, char)
      else
        turn
      end
      display_board
    end
#
    def won?
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination # return the win_combination indexes that won.
        elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
    end
  end
end
#
#   def full?
#     @board.all? do |pos|
#       pos == "X" || pos == "O"


    # def play
    #   while !over?
    #     turn
    #   end
    #   if won?
    #     puts "Congratulations #{winner}!"
    #   else
    #     puts "Cat's Game!"
    #   end

# #GET the value of a variable
# #SET the value of a variable
# #DEFINE the steps of a function
# #EXECUTE the steps of a function
