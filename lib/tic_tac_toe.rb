class TicTacToe
  def initialize
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
    index = user_input.to_i - 1
  end

  def move(index, token = "X")
    def update_array_at_with(index, value)
      @board[index] = value
    end
    update_array_at_with(index, token)
  end

  def position_taken?(position)
  if
    @board[position] == " " || @board[position] == ""
      false
  elsif
    @board[position] == nil
      false
  else
    @board[position] == "X" || "O"
      true
    end
end

def valid_move?(position)

  if position_taken?(position) == false &&
    position <= 8 && position >= 0
    return true
  else
    false
  end
end

def turn_count
  @board.count("X") + @board.count("O")
end

def current_player
  if turn_count % 2 == 0
  return "X"
else
  return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]

  if position_1 == "X" &&
     position_2 == "X" &&
     position_3 == "X"
     return combination

   elsif
     position_1 == "O" &&
     position_2 == "O" &&
     position_3 == "O"
     return combination
   end
 end
    false
 end

def full?
   index = [0, 1, 2, 3, 4, 5, 6, 7, 8]
   index.each do |position|
     if @board[position] == " " || @board[position] == ""
       return false
     end
   end
   true
 end

def draw?
  if won?
    false
  elsif full?
    true
  end
end

def over?
  if full? || won? || draw?
    true
  end
end

def winner
  if won?
    @board[won?[0]]
  else
    nil
  end
end


def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(index) == false
      turn
    else
      move(index, current_player)
      draw?
    end
    display_board
  end

  def play
    until over? || draw?
      turn
    end
      if won?
        champion = winner
        puts "Congratulations #{champion}!"
      end
        puts "Cat's Game!"
    end
end
