require "pry"
class TicTacToe
 
 def initialize(board = nil) 
   @board = board || Array.new(9, " ")
 end
 
 WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6,], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
 
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
 
 def move(index, position = "X")
   @board[index] = position 
 end
 
 def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
 end
 
 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end  
 
 def turn_count
   turns = 0 
   @board.each do |token|
     if token == "X" || token == "O" 
       turns+=1 
     end
    end
 turns
 end
 
 def current_player
   turn_count % 2 == 0? "X":"O"
 end
 
 def turn 
   puts"Please enter a number 1-9:"
   input=gets.strip
   input_to_index(input)
    if valid_move?(input.to_i-1)
      move(input.to_i-1, current_player)
    else
      turn
    end
    display_board
  end
   
   def won?
     WIN_COMBINATIONS.detect do |win|
         @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
        end
   end
   
   def full?
     @board.all?{|token| token == "X" || token  == "O"}
   end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end
    
    def play
      while over? == false
       turn
      end
      if won?
        puts"Congratulations #{winner}!"
      else
        puts"Cat's Game!"
      end
    end
    
      

 
 
 end
 
  
  
  
  
  
  
  
  
  
  
  