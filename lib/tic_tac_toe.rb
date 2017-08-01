class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number.to_i - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    end
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter = counter + 1
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
    number = gets.strip
    index = input_to_index(number)
    character = current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]
       @board[win_index_1] == @board[win_index_2] && @board[win_index_1] == @board[win_index_3] && position_taken?(win_index_1)
     end
   end

   def full?
     @board.all? do |index|
       index == "X" || index == "O"
     end
   end

   def draw?
     full? == true && won? == nil
   end

   def over?
     won? || draw? == true || full? == true
   end

   def winner
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]
       if @board[win_index_1] ==  "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
         return "X"
       elsif @board[win_index_1] ==  "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
         return "O"
       end
     end
     return nil
   end

   def play
     until over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
   end
end
