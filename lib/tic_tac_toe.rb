require "pry"
class TicTacToe
  attr_accessor :board
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end 
   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i-1
  end 
  
    def move(index, token="X")
     @board[index] = token
    end
      
   def position_taken?(index)
      @board[index] != " "
   end
   
   def valid_move?(index)
     if position_taken?(index) == false && index.between?(0,8)
       true
     else
       false
     end
   end
  
   
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
     
     def current_player
       turn_count % 2 == 0 ? "X" : "O"
     end
      
  def turn 
    display_board
    puts "Please pick a position between 1-9"
    user_input = gets.strip 
    #binding.pry
     index = input_to_index(user_input)
        if valid_move?(index)
          #binding.pry
          move(index, current_player)
        else 
          turn
        end 
   end 
    
    def won? 
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " " && @board[combo[0]] != ""
          return combo
        end
        end 
          return false
      end
      
  def full?
    #binding.pry
    if turn_count == 9
      return true
    else
      return false
   end
   end
  
  
  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end 
  
  def over?
    if draw? == true || won? != false
      return true
    else
      return false
    end
  end
  
  def winner
    combo = won?
      if won? != false && board[combo[0]] == "X"
      return "X"
        elsif won? != false &&  board[combo[0]] == "O"
        return "O"
      else
        return nil
      end
   end
  
  def play
   # binding.pry
    until over?
    turn
    end
   # binding.pry
        if won?
        puts "Congratulations #{winner}!"
        else
        puts "Cat's Game!"
        end
    end
end