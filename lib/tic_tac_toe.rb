class TicTacToe
  def initialize()
    @board = Array.new(9," ")
  end


WIN_COMBINATIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]
                  ]
                  
def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def won?()
  won = false
  WIN_COMBINATIONS.each do |win_combination|
     position_1 = @board[win_combination[0]]
     position_2 = @board[win_combination[1]]
     position_3 = @board[win_combination[2]]
     if (position_1 == "X" && position_2 == "X"  && position_3 == "X") || (position_1 == "O" && position_2 == "O"  && position_3 == "O")
       return win_combination.to_a
     end
  end
  return false
end

def full?()
  @board.none? { |element| element ==" " }
end

def draw?()
  full?() && !won?()
end

def over?()
  won?() || full?() || draw?()
end

def winner()
  winner_combination = won?()
  if !winner_combination
    return nil
  end
  if @board[winner_combination[0]] == "X"
    return "X"
  else
    return "O"
  end
end
def turn_count()
  @board.count {|token| token=="X" || token == "O"}
end

def current_player()
  turn_count % 2 == 0 ? "X" : "O"
end


# code your input_to_index and move method here!
def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(position, char="X")
  @board[position]=char
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return TRUE
  else
    return FALSE
  end
end

def turn()
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player())
  else
    turn()
  end
  display_board()
end

def play()
  while !over?()
    turn()
  end

  if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
 # puts "Game over"
end


end # End class definition
                  
