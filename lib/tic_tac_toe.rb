class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
   
    [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [6,4,2],
    [8,4,0],
    [0,3,6],
    [1,4,7],
    [2,5,8]
        ]   
      
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def position_taken?(index, token="X")
    @board
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    position_taken?(index, token) == false && index.between?(0, 8) == true
  end
  
  def input_to_index(user_input)
    @user_input = user_input
    user_input = user_input.to_i-1
    index = user_input
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def valid_move?(index)
    position_taken?(index) == false && index.between?(0, 8) == true
  end
  
  def turn
    puts "Please enter 1-9" 
    user_input = gets.strip
    index = input_to_index(user_input)
    @valid_move
    if valid_move?(index)
      move(index, token="X" )
        display_board
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
    @board
    WIN_COMBINATIONS.each do |win_combination| 
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
   
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2] 
    position_3 = @board[win_index_3] 
 
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    elsif draw?
      false
    end 
  end
    false #what does this correspond to?
  end

  def full?
    @board.all? do |token| 
      token == "X" || token == "O"
    end 
  end

  def draw?(index)
    if @board[@index] != " "
      true
    elsif @board[@index] = WIN_COMBINATIONS
      false
    else @board[@index] == " "
      false
    end
  end

  def over?
    if won?(@board) || draw?(@board)
      true
    elsif draw?(@board)
      true
    else @board == " "
      false
    end
  end

  def winner
    if !won?(@board) == false
      @board[won?(@board).first]
    end
  end

  # def play(input_to_index)   
  #   @user_input = user_input
  #   user_input = user_input.to_i-1
  #   index = user_input
  #   until over?  
  #   @turn
  #   end
  #     if won?
  #       puts "Congratulations #{winner(@board)}!"
  #     elsif draw?
  #       puts "Cat's Game!"
    
  #     end
  # end
  
 
end