class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  @user_input = user_input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
if  @board[index] == "" || @board[index] == " " || @board[index] == nil
false
else
  true
end
end

def valid_move?(index)
if !position_taken?(index) && index.between?(0,8)
    true
  else
    false
end
end

def turn_count
  @turn = 0
  @board.count do |token|
    if token == "X" || token == "O"
    @turn +=1
  end
end
end

def current_player
if turn_count % 2 == 0
  "X"
else
  "O"
end
end
def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index,current_player)
  else
    turn
    end
    display_board
  end


def won?
 WIN_COMBINATIONS.detect do |win_combo|
     position_1 = @board[win_combo[0]]
        position_2 = @board[win_combo[1]]
        position_3 = @board[win_combo[2]]

        position_1 == "X" && position_2 == "X" && position_3 == "X" ||
        position_1 == "O" && position_2 == "O" && position_3 == "O"
      end
    end

    def full?
      @board.all? do |position|
        position == "X" || position == "O"
      end
    end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end

def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end


  def play
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
