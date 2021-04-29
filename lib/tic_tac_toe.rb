class TicTacToe
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
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

	def input_to_index(input)
  	input.to_i - 1
	end

	def move(index, char)
	  @board[index] = char
	end

	def position_taken?(index)
	  if @board[index] == " " || @board[index] == "" || @board[index] == nil
	    false
	  elsif @board[index] == "X" || @board[index] == "O"
	    true
	  end
	end

	def valid_move?(index)
	  !position_taken?(index) && index.between?(0, 8)
	end

	def turn_count
		counter = 0
		@board.each do |cell|
			if cell == "X" || cell == "O"
				counter += 1
			end
		end
		counter
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def turn
		puts "Please enter 1-9:"
		position = gets.strip
		index = input_to_index(position)
		if valid_move?(index)
			move(index, current_player)
			display_board
		else
			turn
		end
	end

	def won?
		WIN_COMBINATIONS.each do |win_combination|
			win_index_1 = win_combination[0]
			win_index_2 = win_combination[1]
			win_index_3 = win_combination[2]

			position_1 = @board[win_index_1]
			position_2 = @board[win_index_2]
			position_3 = @board[win_index_3]

			if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
				 (position_1 == "O" && position_2 == "O" && position_3 == "O")
				return win_combination
			else
				false
			end
		end
		false
	end

	def full?
		@board.all? do |position|
			position == "X" || position == "O"
		end
	end

	def draw?
		!won? && full?
	end

	def over?
		won? || draw? || full?
	end

	def winner
		if won?
			win_combo = won?
			@board[win_combo[0]]
		else
			nil
		end
	end

	def play
		loop do
			if over?
				break
			end
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cat's Game!"
		end
	end
end