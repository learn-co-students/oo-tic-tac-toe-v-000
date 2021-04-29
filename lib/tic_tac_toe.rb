class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

#display_board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

#move
def move(index, current_player)
  @board[index] = current_player
end

#position_taken
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

#valid_move
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

#turn
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  # current_player = current_player(board)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

#turn_count
def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
     counter += 1
    end
   end
   return counter
end

#current_player
def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

#won?
def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
end

#full?
def full?
  if @board.include?(" ")
    return false
  else
    return true
  end
end

#draw?
def draw?
 if full?&& !(won?)
   return true
 else
   return false
 end
end

#over?
def over?
  if won?|| draw? || full?
    return true
  else
    return false
  end
end

#winner
def winner
  if won?
    win_combination =  won?
    winner = @board[win_combination[0]]
    return winner
  else
    return nil
  end
end


# Define your play method below
def play
  until over?
    turn
  end
  if won?
    #winner = winner(board)
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end






end
