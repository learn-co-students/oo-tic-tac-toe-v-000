class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
]

  def display_board
    row0 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row1 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row2 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    lines = '-----------'
    puts row0, lines, row1, lines, row2
  end

  def move(index, char)
    index = index.to_i - 1
    @board[index] = char
  end


  def position_taken?(index)
    if  @board[index] == "X" || @board[index] == "O"
      true
    elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    end
  end

  def valid_move?(position)
    position = position.to_i
    if
      position.between?(1, 9) && !position_taken?(position.to_i - 1)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    # index = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|entry| entry == "X" || entry == "O"}
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    if @board.all? {|element| element == " "}
      false
    else
      WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]] != " " && (@board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]])
          return win_combination
        end
      end
      false
    end
  end

  def full?
    if @board.all? {|element| position_taken?(@board.index(element))}
      true
    else
      false
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? != false || full?
  end

  def input_to_index(input)
    input.to_i - 1
  end
  #input.to_i - 1

  def winner
    if won? != false
      @board[won?[0]]
    end
  end


  def play
    until over? || draw?
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
  end

end




# one error
# class TicTacToe
#
#   def initialize
#     @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#   end
#
#   WIN_COMBINATIONS = [
#   [0,1,2], #top row
#   [3,4,5], #middle row
#   [6,7,8], #bottom row
#   [0,3,6], #first column
#   [1,4,7], #second column
#   [2,5,8], #third column
#   [0,4,8], #left diagonal
#   [2,4,6]  #right diagonal
# ]
#
#   def display_board
#     row0 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     row1 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     row2 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#     lines = '-----------'
#     puts row0, lines, row1, lines, row2
#   end
#
#   def move(index, char)
#     index = index - 1
#     @board[index] = char
#   end
#
#   def move2(index, char)
#     @board[index] = char
#   end
#
#
#   def position_taken?(index)
#     if  @board[index] == "X" || @board[index] == "O"
#       true
#     elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
#       false
#     end
#   end
#
#   def valid_move?(position)
#     if position.to_i.between?(0, 8) && !position_taken?(position)
#       true
#     else
#       false
#     end
#   end
#
#   def turn
#     puts "Please enter 1-9:"
#     input = gets.strip
#     index = input_to_index(input)
#     if valid_move?(index)
#       move2(index, current_player)
#       display_board
#     else
#       turn
#     end
#   end
#
#   def turn_count
#     @board.count {|entry| entry == "X" || entry == "O"}
#   end
#
#   def current_player
#     if turn_count.even?
#       "X"
#     else
#       "O"
#     end
#   end
#
#   def won?
#     if @board.all? {|element| element == " "}
#       false
#     else
#       WIN_COMBINATIONS.each do |win_combination|
#         if @board[win_combination[0]] != " " && (@board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]])
#           return win_combination
#         end
#       end
#       false
#     end
#   end
#
#   def full?
#     if @board.all? {|element| position_taken?(@board.index(element))}
#       true
#     else
#       false
#     end
#   end
#
#   def draw?
#     !won? && full?
#   end
#
#   def over?
#     won? != false || full?
#   end
#
#   def input_to_index(input)
#     input.to_i - 1
#   end
#   #input.to_i - 1
#
#   def winner
#     if won? != false
#       @board[won?[0]]
#     end
#   end
#
#
#   def play
#     until over? || draw?
#       turn
#     end
#     if won? != false
#       puts "Congratulations #{winner}!"
#     end
#     if draw?
#       puts "Cats Game!"
#     end
#   end
#
# end
