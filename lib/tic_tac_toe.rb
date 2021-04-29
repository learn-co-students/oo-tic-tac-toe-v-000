class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def initialize(board = Array.new(9," "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  (user_input.to_i) - 1
end


def move(input_to_index, player_character)
  @board[input_to_index] = player_character
end

def position_taken? (index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
     false
   else
     true
   end
end

def valid_move?(index)
  if index.between?(0, 8) && !position_taken?(index)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9"
  input = gets.strip
  @index = input_to_index(input)
  if valid_move?(@index)
    move(@index, current_player)
    display_board
  else
    turn
      end
end



def turn_count
  @board.count{ |current_space| current_space == "X" || current_space == "O"}
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |winner_combination|
    win_index_1 = winner_combination[0]
    win_index_2 = winner_combination[1]
    win_index_3 = winner_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return winner_combination
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
  if (full?) && (!won?)
    true
  else
    false
  end
end



def over?
  if won? || full?
    true
  else
    false
  end
end

def winner
  if winning = won?
    position = winning[0]
    return @board[position]
  else
    nil
  end
end

def play
  until over? || draw?
    turn
  end

  if won?
    player = winner
    puts "Congratulations #{player}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
