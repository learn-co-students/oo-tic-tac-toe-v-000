require "pry"
class TicTacToe




  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
    def board
      @board
    end
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end

      def move(index,current_player = "X")
        @board[index] = current_player
      end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def turn_count
   @board.count{|token| token == "X" || token == "O"}
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


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
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
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end






def won?
  WIN_COMBINATIONS.detect do |mini|
  if  mini.all? { |space| board[space] == "X"}
    return mini
  elsif mini.all? { |space| board[space] == "O"}
    return mini
  end
  end
end

def full?
  @board.all? do |space|
    if space == " "
      false
    else
      true
    end
  end
end

def draw?
full? && !won?
end



def over?
  if !draw? && !won?
    false
  else
    true
  end

end

def winner
  if wonder? == "X"
    "X"
  elsif wonder? == "O"
    "O"
  else
    nil
  end
end

    def wonder?
      WIN_COMBINATIONS.detect do |mini|
      if  mini.all? { |space| @board[space] == "X"}
        return "X"
      elsif mini.all? { |space| @board[space] == "O"}
        return "O"
      end
    end
  end

  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]







def input_to_index(user_input)
  user_input.to_i - 1
end








def play
  until over?
    turn
  end
  if wonder? == "X"
    puts "Congratulations X!"
  elsif wonder? == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
