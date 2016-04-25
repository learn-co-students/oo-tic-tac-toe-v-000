class TicTacToe
	def initialize
		@board = Array.new(9, " ")
	end

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]

	def move(location, token = "X")
		@board[location.to_i-1] = token
	end

	def position_taken?(location)
		!(@board[location].nil? || @board[location] == " ")
	end

	def valid_move?(location)
		(location.to_i-1).between?(0, 8) && !(position_taken?(location.to_i-1))
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.strip
		if valid_move?(input)
			move(input, token = current_player)
		elsif !valid_move?(input)
			turn
		end
		display_board
	end

	def turn_count
		counter = 0
		@board.each do |location|
		if location != " " && location != ""
		counter += 1
		end
	end
	counter
	end

	def current_player
		turn_count.even? ? "X" : "O"
	end

	def won?
		WIN_COMBINATIONS.select do |win_combination|
			if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
				return win_combination
			elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
				return win_combination
			end
		end
		if @board.all?{|location| location == " "}
			false
		end
	end

	def full?
		if @board.none?{|position| position == " "}
			true
		end
	end

	def draw?
		if full? && !won?
			true
		end
	end

	def over?
		if draw? || won?
			true
		end
	end

	def winner
		WIN_COMBINATIONS.select do |win_combination|
			if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
				return "X"
			elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
				return "O"
			end
		end
		if !won?
			nil
		end
	end

	def play
		until over?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cats Game!"
		end
	end
end