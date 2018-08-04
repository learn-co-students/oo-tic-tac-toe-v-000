class TicTacToe
  
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
  
######################################################################################
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
######################################################################################
  
  def input_to_index(entry)
     @index = entry.to_i - 1
  end
  
######################################################################################
  
  def move(entry, current_player="X")
    @board[entry] = current_player
  end
  
######################################################################################

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
######################################################################################
  
  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
  end
  
######################################################################################
  
  def turn
    puts "Please enter 1-9:"
    user_entry = gets.strip.to_i - 1  
    input_to_index(user_entry+1)
  
     if valid_move?(user_entry)
      move(user_entry,current_player)
      display_board
    else
      until valid_move?(user_entry) do
       puts "That is not a valid move. Please enter 1-9:"
        user_entry = gets.strip.to_i - 1
      end
      move(user_entry,current_player)
      display_board
    end
  end
  
######################################################################################

  def turn_count
    counter = 0 
    @board.each do |entry|
      if entry != " "
        counter += 1
      end
    end
    return counter
  end
  
######################################################################################

  def current_player
    player_turn = turn_count + 1
  
    if player_turn % 2 == 0 
      return "O"
    else
      return "X"
    end
  end
  
######################################################################################
  
  def won?
    
    WIN_COMBINATIONS.each do |win_combo|
    windex_1 = win_combo[0]
    windex_2 = win_combo[1]
    windex_3 = win_combo[2]
    
    position_1 = @board[windex_1] 
    position_2 = @board[windex_2] 
    position_3 = @board[windex_3] 
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" &&   position_2 == "O" && position_3 == "O") 
        return win_combo
        end
      end 
    return false 
  end
  
######################################################################################

  def full?
   @board.each do |entry|
      if entry == " "
       return false 
       end
      end
    return true 
  end
  
######################################################################################

  def over?
    if full? || draw? || won?
      return true
    else 
      return false 
    end
  end

######################################################################################

  def draw?
    if !won? && full?
      return true
    else
      return false 
    end
  end
  
######################################################################################
  
  def winner
  
  if won?.kind_of?(Array)
    return @board[won?[0]]
  end
end

######################################################################################

def play
  
  while !over?
    turn
  end
    
  if won?.kind_of?(Array)
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end