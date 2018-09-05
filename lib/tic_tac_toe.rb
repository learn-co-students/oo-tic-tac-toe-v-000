
class TicTacToe 
  def initialize (board = nil) 
    @board = board || Array.new(9, " ") 
  end
  
  def play 
    @play  
  end 
  
  
 WIN_COMBINATIONS =  [
   [0,1,2], [3,4,5],[6,7,8],
   [0,3,6], [1,4,7], [2,5,8],
   [0,4,8], [2,4,6]
   ]
  
 
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

  def move(index, token = "X")
    @board[index] = token
    
  end
  
  def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
#   board(input_to_index[user_input])
#     if [index] > 0 && [index] < 10
#       puts "Valid entry."
#     else
#       puts "Invalid entry."
#     end
# end


  def turn
    
    puts "Please enter 1-9"  
      input= gets.strip
      input_to_index
    
    if valid_move?
      move(input_to_index)
      display_board
      
      token = current_player
      move(current_player)
      
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
  #for each win_combination in WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combination|
    
  
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
   
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
   
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return win_combination 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O" 
      return win_combination
    else
      false
    end
  
  end
  false
  end
 


  def full?
   @board.all? {|b| b != " " } 
  end
 
  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    winning_array = won?
    if won? 
        return @board[winning_array[0]] 
  
    else
        return nil
    end
    
  end
  
  
  
  def play
   9.times {turn}
   
    if position_1 == X && position_2 == X && position_3 == X 
      return WIN_COMBINATION
    
    puts "Congratulations, you are the winner!"
    
    elsif position_1 == O && position_2 == O && position_3 == O
      return WIN_COMBINATION
    
    else
      false
    end
    
  end


end

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
