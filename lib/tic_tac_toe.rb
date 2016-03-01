class TicTacToe
	def initialize
		@board = Array.new(9, " ")
	end

	WIN_COMBINATIONS = [
		[0,1,2], #toprow
		[3,4,5], #middlerow
		[6,7,8], #bottomrow
		[0,3,6], #col1
		[1,4,7], #col2
		[2,5,8], #col3
		[0,4,8], #diag1
		[6,4,2]
	]

	def display_board
  		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  		puts "-----------"
  		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  		puts "-----------"
  		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(location, current_player = "X")
    	@board[location.to_i-1] = current_player
	end

	def position_taken?(location)
  		@board[location] != " " && @board[location] != ""
	end

	def valid_move?(position)
  		position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
	end

	def turn
  		puts "Please enter 1-9:"
  		input = gets.strip
  		if valid_move?(input)
    		move(input, current_player)
  		else
    		turn
  		end
  		display_board
	end

	def turn_count
		turn = 0
		@board.each do |mark|
		if mark == "X" || mark == "O"
			turn += 1
		end
		end
		turn
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def won?
		WIN_COMBINATIONS.detect do |combo|
			if combo.all? {|position| @board[position] == "X"}
				return combo
			elsif combo.all? {|position| @board[position] == "O"}
				return combo
			else
				false
			end
		end
	end 

	def full?
		@board.each_index do |position|
			if !position_taken?(position.to_i)
				false
				break

			else
				true
			end
		end
	end 

	def draw?
		if full?
		 	true
			if won?
				false
			else
				true
			end
		else
			false
		end
	end

	def over?
		if full? || won? || draw?
			true
		else
			false
		end
	end

	def winner
		if won?
			if @board[won?[0]] == "O"
				return "O"
			else
				"X"
			end
		end
	end

	def play
		display_board
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