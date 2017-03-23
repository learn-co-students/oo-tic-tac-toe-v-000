class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],

    [0,3,6],
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6],
    ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts " "
  end


  def input_to_index(string)
    string.to_i - 1
  end


  def move(index, player)
   @board[index] = player
 end

 def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
 def position_taken?(index)
   @board[index] != " "
 end

 def turn_count
  board.count do |position|
     position != " "
   end
 end

 def current_player
   turn_count.even? ? "X" : "O"
 end

 def turn
   puts "Please enter a number (1-9):"
   player = gets.strip
   index = input_to_index(player)
   if valid_move?(index)
     player = current_player
     move(index, player)
   else
     turn
   end
   display_board
 end



end

end
