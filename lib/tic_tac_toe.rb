
class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

def input_to_index (user_input)
  (user_input).to_i - 1
end

def move(user_input, token = "X")
  @board[user_input] = token
end

def position_taken? (user_input)
   if @board[user_input] == "X" || @board[user_input] == "O"
     true
   else
     false
end
end

def valid_move?(user_input)
  if position_taken?(user_input) == false && user_input.between?(0, 8)
    true
  else
    false
  end
end

def turn_count
    counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
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

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_input=input_to_index(user_input)
  if ! valid_move?(user_input) #how to add current_player to this?
    puts "That is not a valid move."
    turn
  else
    token = current_player
    move(user_input, token)
    display_board
  end
end


def won?
    WIN_COMBINATIONS.find do |place|
      @board[place[0]]=="X" && @board[place[1]]=="X" && @board[place[2]]== "X" ||
      @board[place[0]]=="O" && @board[place[1]]=="O" && @board[place[2]]== "O"
    end
  end

  def full?
    @board.all? do |index|
      index== "X" || index=="O"
      end
    end

    def draw?
  ! won? && full?
    end

    def over?
      draw? || won?
    end


    def winner
      won? ?   @board[won?[0]] : nil
    end

    def play
      while ! over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
          puts "Cat's Game!"
      end
    end

end
