class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
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
   def move(index,current_player = "X")
     @board[index] = current_player
   end
 
   def position_taken?(index)
     @board[index] != " " && @board[index] != ""
  end
   def valid_move?(index)
  !position_taken?(index) && index.between?(0,8) 
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
    turn = 0
  @board.each do |token|
    if token == "X" || token == "O"
       turn += 1
      end
     end
       return turn
  end
   def current_player
    player_turn = turn_count
  if player_turn % 2 == 0
    "X"
  elsif player_turn % 2 == 1
  "O"
   end 
end
   def won?
     WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        return win_combo
      end
    end
    return false
  end
   #ternary syntax
  def full?
   @board.all? do |token|
    token == "X" || token == "O"
    end
end
   def draw?
    full?  &&  !won?
  end
   def over?
    draw?  ||  won?
  end
   def winner
    if won?
     @board[won?[0]]
  else
     nil
  end
end
     def play
     while !over?
     puts current_player
     turn
     end
     if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
      end
end
   
   


 


  
  
