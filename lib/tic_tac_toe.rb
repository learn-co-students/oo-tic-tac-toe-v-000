class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
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
    user_input.to_i - 1
  end
  def move(position, character = "X")
    @board[position] = character
  end
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] != " "
      return true
    end
  end
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      return true
    elsif position_taken?(index) == true
      return false
    end
  end
  def turn_count
    turn_count = 0
    @board.each do |position|
      if position == "X" || position == "O"
      turn_count += 1
      end
    end
    return turn_count
  end
  def current_player
    if turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == true
      move(index, character = "#{current_player}")
      display_board
    else
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
    end
  end
  def won?
      WIN_COMBINATIONS.detect { |win_combination|
             win_combination.all? { |win_combination_index|
          @board[win_combination_index] == "X" } ||
                 win_combination.all? { |win_combination_index|
             @board[win_combination_index] == "O" }}
   end
   def full?
     @board.none? { |positions| positions == " "}
   end
   def draw?
     if won?
       false
     elsif full?
       true
     else
       false
     end
   end
   def over?
     if won?
       true
     elsif draw?
       true
     else
       false
     end
   end
   def winner
     if WIN_COMBINATIONS.detect { |win_combination|
            win_combination.all? { |win_combination_index|
         @board[win_combination_index] == "X" }}

       "X"
     elsif WIN_COMBINATIONS.detect { |win_combination|
       win_combination.all? { |win_combination_index|
         @board[win_combination_index] == "O" }}
       "O"
     end
   end
   def play
     until over?
            turn
            draw?
       end
       if winner == "X"
         puts "Congratulations X!"
       elsif winner == "O"
         puts "Congratulations O!"
       elsif draw?
         puts "Cat's Game!"
       end

   end



end
