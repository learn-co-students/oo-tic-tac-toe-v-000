require "pry"

class TicTacToe
  def initialize (board=nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,3,6],  # Left col
   [1,4,7],  # Middle col
   [2,5,8],  #Right col
   [0,4,8], #Diag Right
   [2,4,6]  #diag left
 ]

 def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end

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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  def won? #returns winning array if someone won, false if no one did
  if @board==[" "," "," "," "," "," "," "," "," "] || @board == ["","","","","","","","",""]
    nil
  end
      WIN_COMBINATIONS.any? do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
      position = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
          if position.uniq.count <=1 && position[0] != " "
        return win_combination # return the win_combination indexes that won.
      end
    end
    false
    end

  def full?
  if @board.include?(" ")
      false
  else
    true
  end
  end

  def draw?
    if !full?
      false
    elsif won?
      false
    else
      true
    end
  end

  def over?
  if draw?
    true
  elsif won?
    true
  else
    false
  end
  end

 def winner
   if draw?
     nil
   elsif won? != false
     winner=@board[won?.first]
     return winner
  end
 end

 def play
   moves=0
   until moves==9
  if draw?
    puts "Cat's Game!"
    break
  end
  if won? != false
    puts "Congratulations #{winner}!"
    break
  end
  if over?
    break
  end
  turn
  moves+=1
end
end

end
