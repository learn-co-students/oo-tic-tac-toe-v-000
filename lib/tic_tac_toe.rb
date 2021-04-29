class TicTacToe 
  
  def initialize(board = nil)
    @board = board || Array.new([" "," "," "," "," "," "," "," "," "])
  end   
  
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row 
    [3,4,5], #middle row 
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
   
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player = "X")
  @board[index] = player 
  end   
  
  def position_taken?(location)
    @board[location] == "X" || @board[location] == "O"
   end      
 
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
   counter = 0
   @board.each do |unit|
     if unit == "X" || unit == "O"
      counter += 1 
     end
   end
  return counter 
  end 

  def current_player
    if turn_count % 2 == 0
      player = "X"
    else   
      player = "O"
    end
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
   WIN_COMBINATIONS.detect do |win_group|
    @board[win_group[0]] == @board[win_group[1]] && @board[win_group[1]] == @board[win_group[2]] && position_taken?(win_group[0]) 
   end 
  end 

  def full?
   @board.all? {|idx| idx == "X" || idx == "O"}
  end
  
  def draw?
   !won? && full?
  end   
  
  def over?
   won? || draw?
  end 
  
  def winner
   WIN_COMBINATIONS.detect do |win_group|
     if (@board[win_group[0]] == "X") && (@board[win_group[1]] == "X") && (@board[win_group[2]] == "X")
      return "X"
     elsif (@board[win_group[0]] == "O") && (@board[win_group[1]] == "O") && (@board[win_group[2]] == "O")
      return "O"
     else 
     nil
     end 
   end  
  end  
  
  def play
   while !over?
    turn
   end
   if won?
    puts "Congratulations #{winner}!"
   elsif draw?
    puts "Cat's Game!"
   end
  end
end   