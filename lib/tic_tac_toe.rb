# require 'pry'
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
  
  def position_taken?(index)
    
    @board[index] != " "
      
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) 
  end
  
  def input_to_index(user_input)
    user_input.to_i-1
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def turn
    puts "Please enter 1-9" 
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
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
    WIN_COMBINATIONS.detect do |win_combination| 
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
   
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2] 
    position_3 = @board[win_index_3] 
 
     position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
   end
     
  end

  def full?
    @board.all? do |token| 
      token == "X" || token == "O"
    end 
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?.first]
      # else won? == WIN_COMBINATIONS
      # true
    end
  end

  def play
    @board
    @input_to_index
     until over?  
      turn
     end
    if won?
      puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
    
   end 
  end
  
 
end