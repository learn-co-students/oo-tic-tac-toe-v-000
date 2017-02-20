

# class TicTacToe
# 	def initialize
# 		@board = Array.new(9, " ")
# 	end

# 	WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [2,4,6],
#   [0,4,8]
# ]


# def display_board
# 	    cell = "   "
# 	    separator = "-----------"
# 	    row1 = " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
# 	    row2 = " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
# 	    row3 = " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
# 	    puts row1
# 	    puts separator
# 	    puts row2
# 	    puts separator
# 	    puts row3
# end

#   def input_to_index(user_input)
#     user_input.to_i - 1
#   end


# def move(player_to_fill,player_character="X")
#   @board[player_to_fill]=player_character
# end

# # def position_taken?(index)
# # 	if @board[index] == " " || @board[index] == "" || @board[index] == nil
# # 		 false
# # 	 else
# # 		 true
# # 	end

#   def position_taken?(index)
#     @board[index] != " "
#   end

# def valid_move?(index)
# 	index.between?(0,8) && !position_taken?(index)
# end


# 	def turn_count
# 		@board.count {|spot| spot == "X" || spot == "O"}
# 	end

# 	def current_player
#   if turn_count % 2 == 0
# 	return "X"
# elsif turn_count % 2 != 0
# 		return "O"
# end
# end

# def turn
# 	puts "Please enter 1-9:"
# 	user_input = gets.strip
# 	index = input_to_index(user_input)
# 	if valid_move?(index)
# 		token = current_player
# 		 move(index,token)
# 		 else
# 		 turn
# 	 end
# 		 display_board
# 	 end
	
# def won?
# board_collection_X = @board.each_index.select {|i| @board[i] == "X"}
# board_collection_O = @board.each_index.select {|i| @board[i] == "O"}
# WIN_COMBINATIONS.each do |element|
#   return element if (element-board_collection_X).empty? || (element-board_collection_O).empty?
# end
# return false
# end

# def full?
#   if @board.include?(" ")
# return false
# else
#   return true
# end
# end


# def draw?
#   full? && !won?
# end

# def over?
#   won?|| full?
# end


# def winner
#   if winner_X_Y = won?
#     @board[winner_X_Y.first]
#   end
# end



# def play
#     turn until over?
#     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#   end


# end


class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|square| square != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all?{|square| square != " " }
  end

  def draw?
    full? && !won?
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
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end