#create a class TicTacToe
#initiatize @board
#define an instance variable @board to a new array representingb board array
class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]


  def initialize(board= nil)
    @board= board || Array.new(9, " ")
  end



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



  def move(index, character= "X")
    @board[index] = character
  end


  def position_taken?
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  







    #@board= {[index 0, 8]}
