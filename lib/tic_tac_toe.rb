
class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board
    @board
  end


WIN_COMBINATIONS = [
 [0,1,2],
 [0,3,6],
 [0,4,8],
 [1,4,7],
 [2,4,6],
 [2,5,8],
 [3,4,5],
 [6,7,8]
]

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

def move(index, current_player="X")
  index = index.to_i-1
  @board[index] = current_player
end

def position_taken?(index)
   if (@board[index] == "X" || @board[index] == "O")
    return true
   else return false
 end
 end

def valid_move?(position)
 position = position.to_i - 1
   if !position_taken?(position) && position.between?(0,8)
     return true
   else return false
   end
 end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
        move(input, current_player)
    display_board
  else
     turn
  end
end

def turn_count
  counter = 0
  board.each do |x|
    if x == "X" || x == "O"
      counter += 1
    end
  end
  counter
end

def current_player
    if turn_count % 2 == 0
    "X"
  else
    "O"
end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  end
      end

      def full?
        @board.all? do |pos|
        if pos == "X" || pos == "O"
  true

        end
      end
    end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
   winning_combo = won?
   if winning_combo
     return board[winning_combo[0]]
   else
    nil
   end
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end
end
