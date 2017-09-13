class TicTacToe

  def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end

def board
  @board
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2],
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

  def move(index, char = "X")
  @board[index] = char
  end

  def position_taken?(index)
  if @board[index] == " "
  false
  else
  true
  end
  end

  def valid_move?(index)
  if position_taken?(index) || !index.between?(0,8)
  false
  else
  true
  end
  end

  def turn
  puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(index)
   move(index, current_player)
   display_board
   else
   turn
   end
   end

  def turn_count
  counter = 0
  @board.each do |current_player|
  if current_player == "X" || current_player == "O"
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
    WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
   return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
   return win_combination
   else
   false
   end
   end
   end

   def full?
   if @board.detect { |i| i.include?(" ") }
   false
   else
   true
   end
 end

   def draw?
   if !won? && full?
   true
   else
   false
   end
   end

   def over?
   if !full? && !won? && !draw?
    false
    else
    true
    end
    end

    def winner
    WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
    else draw?
    nil
    end
    end
    end

    def play
    while !over?
    turn
    end
    if won?
    puts "Congratulations #{winner}!"
    else draw?
    puts "Cat's Game!"
   end
   end
end
