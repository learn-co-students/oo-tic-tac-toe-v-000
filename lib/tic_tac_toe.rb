class TicTacToe
def initialize(board = nil)
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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

def move(index, player_token)
@board[index] = player_token
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
!position_taken?(index) && index.between?(0,8)
  end

def turn_count
    @board.count{|index| index != " "}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
  player_token = current_player
     move(index, player_token)
    display_board
  else
    turn
  end

def won?
    WIN_COMBINATIONS.detect do |index|
      @board[index[0]] == @board[index[1]] &&
      @board[index[1]] == @board[index[2]] &&
      position_taken?(index[0])
    end
  end
end

def full?
    @board.all?{|square| square != " " }
end


def draw?
  !won? && full?
end

def over?
  won? || draw?
end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end


    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end
