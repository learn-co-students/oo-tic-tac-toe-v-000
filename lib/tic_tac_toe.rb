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


  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end


  def valid_move?(position)
    if (position).between?(0, 8) && !position_taken?(position)
     true
    else
     false
    end
  end



  def turn
    puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)

    if valid_move?(index)
      move(index, character = current_player)
      display_board
    else
      puts "invalid move"
      turn
   end
   end



 def turn_count
    counter = 0
    @board.each do |space|
   if space == "X" || space == "O"
     counter += 1
   end
   end
    return counter
 end



  def current_player
    if turn_count % 2 == 0
     "X"
   else
     "O"
    end
  end



  def won?

  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3]
  # load the value of the board at win_index_3
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo
   end
   end
    return false
   end


  def full?
   @board.all? {|space| space != " " }
  #board.all?{|token| token == "X" || token == "O"}
  end


 def draw?
   if full? && !won?
    return true
  else
    return false
  end
 end



 def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end


  def winner
    win_combo = won?

    if win_combo != false
      if @board[win_combo[0]] == "X"
        return "X"
      else
        return "O"
      end
    else
      return nil
    end
  end



  def play
    while !over?
     turn
    end
    if won?
      puts "Congratulations #{winner}!"
     else
      puts "Cat's Game!"
    end
  end
end






























    #number_of_ turns










 #if valid_move?(board, index)
    #move(board, index)
  #else
    #turn(board)
  #end
  #display_board(board)
#end




#def turn(board)
  #puts "Please enter 1-9:"
  #input = gets.strip
  #index = input_to_index(input)
