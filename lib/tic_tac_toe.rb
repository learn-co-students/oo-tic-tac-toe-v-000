class TicTacToe
  WIN_COMBINATIONS =[
      [0,1,2], #Top row
      [3,4,5], #Middle row
      [6,7,8], #Bottom row
      [0,3,6], #1st column
      [1,4,7], #2nd column
      [2,5,8], #3rd column
      [0,4,8], #diagonal lfttp to btmrght
      [6,4,2] #diagonal btmlft to top right
    ]
def initialize
  @board=[" "," "," "," "," "," "," "," "," "]
end

def display_board
puts
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(input, player_token)
    @board[input]= player_token
end

def position_taken?(index)
   @board[index] == " " ? false : true
end

def valid_move?(index)
   !position_taken?(index) && index.between?(0,8)
end

def turn_count
  @board.join(" ").delete(" ").length
end

def current_player
   turn_count.even? ? "X" : "O"
end

def turn
  puts "Choose a postion 1-9"
  user_input = gets.strip
  index =input_to_index(user_input)
    if valid_move?(index)
      token=current_player
      move(index,token)

    else
      turn()
    end
    display_board()
end

def won?
  WIN_COMBINATIONS.detect do |winarray|
          if @board[winarray[0]] == "X" && @board[winarray[1]] == "X" && @board[winarray[2]] == "X"
            winarray.to_a
          elsif  @board[winarray[0]] == "O" && @board[winarray[1]] == "O" && @board[winarray[2]] == "O"
            winarray.to_a
          else
           false
          end
        end
end

def full?
  turn_count == 9
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
    if won? == nil
      nil
    else
     @board[won?[0]]
   end
end

def play
  turn until over?
puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end


end
